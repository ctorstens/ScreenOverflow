class TagsController < ApplicationController
  before_filter :signed_in_user


  def show
    @tag = Tag.find_by_name(params[:id]) || Tag.find_by_id(params[:id])
    @posts = Post.tagged_with(@tag.name)
  end

  def index
    @tags = ActiveRecord::Base.connection.execute "SELECT tags.name, count(*) as count  FROM tags INNER JOIN taggings on tags.id = taggings.tag_id GROUP BY 1 ORDER BY name ASC"
  end

  def search
    @tags = Tag.all.map do |t|
      {
        :value => t.name,
        :url => "/tags/" + t.name
      }
    end
    render :json => @tags
  end

end
