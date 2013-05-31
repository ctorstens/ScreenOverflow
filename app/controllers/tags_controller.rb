class TagsController < ApplicationController
  before_filter :signed_in_user


  def show
    # Review: What happens if my post's name is "72", but I'm trying to load a post with the id
    # of 72?
    @tag = Tag.find_by_name(params[:id]) || Tag.find_by_id(params[:id])
    @posts = Post.tagged_with(@tag.name)
  end

  def index
    # Review: This is a bad smell. You shouldn't have any SQL outside your models.
    @tags = ActiveRecord::Base.connection.execute "SELECT tags.name, count(*) as count  FROM tags INNER JOIN taggings on tags.id = taggings.tag_id GROUP BY 1 ORDER BY name ASC"
  end

  def search
    # Review: Again, couldn't this be part of the #index action, using respond_to :format ?
    @tags = Tag.all.map do |t|
      {
        :value => t.name,
        :url => "/tags" + t.name
      }
    end
    render :json => @tags
  end

end
