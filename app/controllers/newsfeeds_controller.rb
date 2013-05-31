class NewsfeedsController < ApplicationController

  def index
  	# Review: Again, move any actual ActiveRecord searching into a model
    @activities = PublicActivity::Activity.order("created_at desc").where(key: ["post.create", "comment.create", "comment.upvoted", "comment.upvoted", "post.upvoted", "post.downvoted"])
  end
end
