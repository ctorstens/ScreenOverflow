class VotesController < ApplicationController

  def create
    p params[:post][:vote]
    @post = Post.find(params[:post][:id])

    if params[:post][:vote] == 'like'
      @post.liked_by current_user
      p "LIKE"
    else
      @post.downvote_from current_user
      p "DISLIKE"
    end

    render :json => {:vote_total => (@post.likes.size - @post.dislikes.size)}, :status => :ok
  end
end