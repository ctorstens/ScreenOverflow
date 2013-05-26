class PostsController < ApplicationController


def parse_video_url(url)
  parse_youtube_unique_code(url) if youtube?(url)
end

def parse_youtube_unique_code(url)
  url =~ /(embed\/|v=)(.{11})/
  $2
end

def youtube?(url)
  !!(url =~ /(youtube.com|youtu.be)/)
end








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
		@comment = Comment.new
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
