class Vote < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :user
  belongs_to :votable, :polymorphic => true

  attr_accessible :user, :votable, :value
end
