class PostsController < ApplicationController
	before_filter :signed_in_user

	impressionist :actions=>[:show,:index]

	def index
		@posts = Post.posts_by_karma
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		@post.user = current_user
		if @post.save
			@post.liked_by current_user
			redirect_to posts_path
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

end
