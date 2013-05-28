class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  acts_as_votable

  default_scope :order => 'created_at ASC'

  attr_accessible :comment, :commentable_id, :commentable_type, :user_id, :post_id, :user, :title

end
