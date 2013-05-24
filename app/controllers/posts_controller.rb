class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
	p params
	post = Post.new(params[:post], user: current_user)
	tags = params[:post][:tags][:description].split(',')
	tags.each do |tag|
		Tag.find_or_create_by_description(description: tag)
	end
	# post.user = User.first
	post.save
		if post.save
			redirect_to root_path
		else
			@errors = post.errors.full_messages.join(' ,')
		end
	end
end