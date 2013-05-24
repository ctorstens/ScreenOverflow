require 'spec_helper'

describe Post do
	let(:user) {build(:user)}
	let(:post) {build(:post)}

	describe "can create a new post" do
		context "with valid input" do
			it "should create a new post" do
				Post.create()
			end
		end
	end
end