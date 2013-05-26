class Post < ActiveRecord::Base
  belongs_to :user
  
  has_many :votes, :as => :votable

  acts_as_taggable
  acts_as_commentable
  acts_as_votable
  
  validates :title, :content, :user, :video_url_code, :video_domain, :presence => true
  attr_accessible :title, :content, :user, :tag_list, :video_url_code, :video_domain, :video_url


  def video_url=(url)
    parsed_url = parse_video_url(url)
    self.video_url_code = parsed_url[:code]
    self.video_domain = parsed_url[:domain]
  end


  def parse_video_url(url)
    domain = ''
    code = ''
    if youtube?(url)
      domain = 'youtube'
      code = parse_youtube_unique_code(url)
    end
    {domain: domain, code: code}
  end

  def parse_youtube_unique_code(url)
    url =~ /(embed\/|v=)(.{11})/
    $2
  end

  def youtube?(url)
    !!(url =~ /(youtube.com|youtu.be)/)
  end














end

