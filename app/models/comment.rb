class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  acts_as_votable

  default_scope :order => 'created_at ASC'

  attr_accessible :user, :post, :content, :title, :comment

end
