class TagsController < ApplicationController
  before_filter :signed_in_user


  def show
    @tag = Tag.find_by_name(params[:id])
    @posts = Post.tagged_with(@tag.name)
  end

  def index
    @tags = Tag.all
  end

  def search
    @tags = Tag.all.map do |t|
      {
        :value => t.name,
        :url => tag_path(t)
      }
    end
    render :json => @tags
  end

end
