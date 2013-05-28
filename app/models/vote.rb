class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, :polymorphic => true

  attr_accessible :user, :votable, :value
end