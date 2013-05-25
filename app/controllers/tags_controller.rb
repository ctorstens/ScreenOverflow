class TagsController < ApplicationController

  def show
    @tag = Tag.find_by_name(params[:name])
    @posts = Post.tagged_with(@tag.name)
  end

  def index
    @tags = Tag.all
  end



end
