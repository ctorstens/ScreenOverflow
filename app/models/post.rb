class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :votes, :as => :votable
end