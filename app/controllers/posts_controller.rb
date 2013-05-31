class PostsController < ApplicationController
	before_filter :signed_in_user

	impressionist :actions=>[:show,:index]

	def index
		@tags = ActiveRecord::Base.connection.execute "SELECT tags.name, count(*) as count  FROM tags INNER JOIN taggings on tags.id = taggings.tag_id GROUP BY 1 ORDER BY count DESC LIMIT 10;"
		@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		@post.user = current_user
		if @post.save
			redirect_to post_path(@post.id)
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments_by_karma
		@comment = Comment.new
		impressionist(@post, message:"wtf is a widget?")
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(params[:post])
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	def search
		@posts = Post.all.map do |p|
			{
				:value => p.title,
				:url => post_path(p)
			}
		end
		render :json => @posts
	end

	def youtube_meta
		video = yt_client.video_by(params[:youtube_id])
		title = video.title
		description = video.description
		tag = video.categories.last.label
		render :json=> {title: title, description: description, tag: tag}
	end

	def by_votes
		@tags = ActiveRecord::Base.connection.execute "SELECT tags.name, count(*) as count  FROM tags INNER JOIN taggings on tags.id = taggings.tag_id GROUP BY 1 ORDER BY count DESC LIMIT 10;"
		@posts = Post.unscoped.order('cached_votes_score DESC').paginate(:page => params[:page], :per_page => 10)
		render :index
	end

	def by_most_viewed
		@tags = ActiveRecord::Base.connection.execute "SELECT tags.name, count(*) as count  FROM tags INNER JOIN taggings on tags.id = taggings.tag_id GROUP BY 1 ORDER BY count DESC LIMIT 10;"
		@posts = Post.unscoped.order('impressions_count DESC').paginate(:page => params[:page], :per_page => 10)
		render :index
	end

end
