require 'spec_helper'

def login_user
	visit_root_path
	click_link 'Sign in with Google'



describe 'Post', :js => true do
# 	before :each do
# 		ApplicationController.any_instance.stub(:current_user) { create(:user) }
# 		visit new_post_path
# 	end

# 	context '#on new post page' do
# 		it "#has a new post form" do
# 			expect {
# 				fill_in "post_title", with: "A title"
# 				fill_in "post_video_url", with: "www.google.com"
# 				fill_in "post_content", with: "This is a description"
# 				fill_in "post_tag_list", with: "tag, bag, leg"
# 				click_button "Submit Post"
# 			}.to change(Post.count).by(1)
# 		end
# 	end 
# end
