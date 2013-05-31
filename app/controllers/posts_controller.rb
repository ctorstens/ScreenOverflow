class PostsController < ApplicationController
	before_filter :signed_in_user

	impressionist :actions=>[:show,:index]

	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		# p params['title']
		puts "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
		puts "PARAMS"
		p params
		@post = Post.new(params)
		puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		puts "POST"
		p @post
		puts "USER"
		puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"

		@post.user = current_user
		p @post

		# respond_to do |format|
		# 	if @post.save
		# 		# redirect_to post_path(@post.id)
		# 		# foramt.html { redirect_to post_path(@post.id) }
		# 		# format.json { status: 'lkadhsflkhasdf' }
		# 		# render :json => {status: 'complete', url: edit_post_path(@post)}
		# 	else
		# 		# render :new
		# 		# format.html { render :action => "new" }
		# 		# format.js
		# 		# render :json => {status: 'fail', url: '/stuff2'}
		# 	end
		# end

		if @post.save
			render :json => {status: 'complete', url: edit_post_path(@post)}
		else
			render :json => {status: 'fail', url: '/stuff2'}
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
		@posts = Post.unscoped.order('cached_votes_score DESC').paginate(:page => params[:page], :per_page => 10)
		render :index
	end

	def by_most_viewed
		@posts = Post.unscoped.order('impressions_count DESC').paginate(:page => params[:page], :per_page => 10)
		render :index
	end

	end
