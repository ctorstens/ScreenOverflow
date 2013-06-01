class NewsfeedsController < ApplicationController

  def index
    @activities = PublicActivity::Activity.order("created_at desc").where(key: ["post.create", "comment.create"])
  end

end
