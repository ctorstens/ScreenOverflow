class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		post = Post.new(params[:post])
		post.user = current_user
		post.save
		if post.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
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

end
