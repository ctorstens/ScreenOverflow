class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  acts_as_votable

  default_scope :order => 'created_at ASC'

#todo: secuirty issue
  attr_accessible :comment, :commentable_id, :commentable_type, :user_id, :post_id,:title, :user

end
