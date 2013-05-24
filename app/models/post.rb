class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :votes, :as => :votable

  acts_as_taggable

  validates :title, :video_url, :content, :user, presence: true

  attr_accessible :title, :video_url, :content, :user, :tags_attributes

end

