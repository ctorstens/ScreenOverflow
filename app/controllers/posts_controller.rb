class PostsController < ApplicationController

	def index
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
	end

	def edit
	end

	def update
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

end
