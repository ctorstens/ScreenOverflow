class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, :polymorphic => true

  attr_accessible :user, :votable, :value

  def vote(object, vote)
    if vote == 'like'
      object.liked_by current_user
    else
      object.downvote_from current_user
    end
  end
end