class Comment < ActiveRecord::Base
  has_many :votes, :as => :votable
  belongs_to :user
  belongs_to :post

  attr_accessible :user, :post, :content
end