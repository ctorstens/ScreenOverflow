class VotesController < ApplicationController
  before_filter :signed_in_user


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
      upvote(object)
    else
      downvote(object)
    end
  end

  def upvote(object)
    if current_user.voted_up_on? object
      object.unliked_by :voter => current_user
    else
      object.liked_by current_user
    end
  end

  def downvote(object)
    if current_user.voted_down_on? object
      object.undisliked_by :voter => current_user
    else
      object.downvote_from current_user
    end
  end
end
