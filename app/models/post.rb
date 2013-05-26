class Post < ActiveRecord::Base
  belongs_to :user
  
  has_many :votes, :as => :votable


  acts_as_taggable
  acts_as_commentable
  acts_as_votable
  
  validates :title, :video_url, :content, :user, :presence => true
  attr_accessible :title, :video_url, :content, :user, :tag_list

end

