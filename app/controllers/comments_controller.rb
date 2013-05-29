class CommentsController < ApplicationController
  before_filter :signed_in_user


  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { render :partial => "/comments/comment", :layout=>false, :locals =>{ :comment => @comment} }
      else
        # render :"comments/show", :layout=>false, :locals=>{:comment=>@comment}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to comment_path(@comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @the_post = @comment.commentable
    @comment.destroy
    redirect_to post_path(@the_post)
  end

end
