class VotesController < ApplicationController

  def post_vote
    @post = Post.find(params[:post][:id])
    vote(@post, params[:post][:vote])
    render :json => {:vote_total => (@post.likes.size - @post.dislikes.size)}, :status => :ok
  end

  def comment_vote
    @comment = Comment.find(params[:id])
    vote(@comment, params[:comment][:vote])
    render :json => {:vote_total => (@comment.likes.size - @comment.dislikes.size), :id => @comment.id}, :status => :ok
  end

  def vote(object, vote)
    if vote == 'like'
      object.liked_by current_user
    else
      object.downvote_from current_user
    end
  end
end
