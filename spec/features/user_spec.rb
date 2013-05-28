require 'spec_helper'

describe 'User', :js => false do
	let!(:user) { create(:user) }
	before(:each) do
		OmniAuth.config.test_mode = true
		ApplicationController.any_instance.stub(:login)
	end

	it "can login with google" do
		visit root_path
		click_link 'Sign in with Google'
		page.current_path.should eq(posts_path)
	end
end