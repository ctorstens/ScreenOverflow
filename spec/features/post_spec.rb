require 'spec_helper'

describe 'Post' do
	let!(:user) { create(:user) }
	let!(:post) { create(:post) }

	before :each do
		ApplicationController.any_instance.stub(:current_user) { user }
	end

	context "post index page" do 
		before :each do
			visit posts_path
		end

		it "should have list of posts" do
			page.should have_content(post.title)
		end

		it "post title should be a link to the post" do
			click_link post.title
			page.should have_content(post.title)
		end

		it "should have a link to submit a new post" #do
		# 	click_link "+Post"
		# 	page.should have_button("Submit Post")
		# end

	end

	context "on new post page" do		
		it "has a new post form" do
			visit new_post_path
			expect {
				fill_in "post_video_url", with: "http://www.youtube.com/watch?v=twE64AuqE9A"
				fill_in "post_title", with: "A title"
				fill_in "post_content", with: "This is a description"
				fill_in "post_tag_list", with: "tag, bag, leg"
				click_button "Submit Post"
			}.to change(Post, :count).by(1)
		end
	end 
end

