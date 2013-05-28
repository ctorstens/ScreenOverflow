class Post < ActiveRecord::Base
  include PublicActivity::Model
   tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  belongs_to :user
  has_many :votes, :as => :votable

  acts_as_taggable
  acts_as_commentable
  acts_as_votable
  
  validates :title, :content, :user, :video_url_code, :video_domain, :presence => true

  attr_accessible :title, :content, :user, :tag_list, :video_url_code, :video_domain, :video_url, :video_url_thumbnail

  before_validation :tag_downcase

  def video_url=(url)
    parsed_url = parse_video_url(url)
    self.video_url_code = parsed_url[:code]
    self.video_url_thumbnail = parsed_url[:thumbnail]
    self.video_domain = parsed_url[:domain]
    self.video_url_time = parsed_url[:time]
  end

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


  def tag_downcase
    self.tag_list = tag_list.map! { |tag| tag.downcase }.uniq
  end

  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => ENV['GOOGLE_USERNAME'] , :password => ENV['GOOGLE_PASSWORD'], :dev_key => ENV['GOOGLE_DEV_KEY'])
  end

end

