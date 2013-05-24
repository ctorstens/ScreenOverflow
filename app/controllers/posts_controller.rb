class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
	p params
	post = Post.new(params[:post])
	post.tag_list = params[:post][:tags][:name]
	post.user = current_user
	post.save
		if post.save
			redirect_to root_path
		else
			@errors = post.errors.full_messages.join(' ,')
		end
	end
end
