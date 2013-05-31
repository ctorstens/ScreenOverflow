class Post < ActiveRecord::Base

  belongs_to :user
  has_many :votes, :as => :votable
  has_many :impressions, :as=>:impressionable

  is_impressionable :counter_cache => true

  acts_as_taggable
  acts_as_commentable
  acts_as_votable
  
  validates :title, :content, :user, :video_url_code, :video_domain, :presence => true

  attr_accessible :title, :content, :user, :tag_list, :video_url_code, :video_domain, :video_url, :video_url_thumbnail

  before_validation :tag_downcase

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def video_url=(url)
    parsed_url = parse_video_url(url)
    self.video_url_code = parsed_url[:code]
    self.video_url_thumbnail = parsed_url[:thumbnail]
    self.video_domain = parsed_url[:domain]
    self.video_url_time = parsed_url[:time]
  end

  # Review: There's a lot of logic in this model related to video URLs.
  # Why not create a new (plain Ruby) class to hold all of this logic?
  def video_url
    return "http://www.youtube.com/embed/" + self.video_url_code + "?html5=1&vq=hd720" if self.video_domain == 'youtube'
  end

  def parse_video_url(url)
    domain = ''
    code = ''
    if youtube?(url)
      domain = 'youtube'
      code = parse_youtube_unique_code(url)
      thumbnail = yt_client.video_by(code).thumbnails.first.url
      time = yt_client.video_by(code).thumbnails.first.time
    end
    {domain: domain, code: code, thumbnail: thumbnail, time: time}
  end

  def parse_youtube_unique_code(url)
    url =~ /(embed\/|v=|\.be\/)(.{11})/
    $2
  end

  def youtube?(url)
    !!(url =~ /(youtube.com|youtu.be)/)
  end

  # Review: I'd rename this to downcase_tags
  def tag_downcase
    self.tag_list = tag_list.map! { |tag| tag.downcase }.uniq
  end

  def comments_by_karma
    self.comments.sort { |a,b| a.comment_karma <=> b.comment_karma }.reverse
  end 

  def self.posts_by_karma
    self.all.sort { |a,b| a.post_karma <=> b.post_karma }.reverse
  end
  
  # Review: Another thing that doesn't seem to belong here. Remember, your classes should have
  # a single responsibility.
  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => ENV['GOOGLE_USERNAME'] , :password => ENV['GOOGLE_PASSWORD'], :dev_key => ENV['GOOGLE_DEV_KEY'])
  end

  def post_karma
    self.likes.size - self.dislikes.size
  end

  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size #UNTESTED: might not be correct syntax
  end
end

