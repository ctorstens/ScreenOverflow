require 'spec_helper'

describe 'User', :js => false do
	let!(:user) {create(:user)}
	let!(:post) {create(:post, :user => user )}

	describe "login" do 
		before(:each) do
			OmniAuth.config.test_mode = true
			OmniAuth.config.mock_auth[:default] = OmniAuth.config.mock_auth[:google]
		end

		it "can login with google" do
			visit root_path
			click_link 'Sign in with Google'
			page.current_path.should eq(posts_path)
		end
	end

	describe "user profile page" do
		before :each do
			ApplicationController.any_instance.stub(:current_user) { user }
		end

		it "can go to the users profile page" do
			visit posts_path
			click_link(user.name)
			page.should have_content(user.name)
		end

		it "has a list of the users posts" do
			visit user_path(user)
			page.should have_content(user.posts.first.title)
		end

		it "has the tags of the posts" do
			visit user_path(user)
			post.tag_list = "hello, kris, joe"
			page.should have_content(user.posts.first.tags.first)
		end
	end
end