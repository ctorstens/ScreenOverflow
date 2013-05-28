class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  acts_as_votable

  default_scope :order => 'created_at ASC'

  attr_accessible :comment, :commentable_id, :commentable_type, :user_id, :post_id, :user, :title

  def comment_karma
    self.likes.size - self.dislikes.size
  end
end
