require 'spec_helper'

describe Post do
	let(:user) {build(:user)}
	let(:post) {build(:post)}

	describe "#can create a new post" do

		context "#with valid input" do
			it "should create a new post" do
				post.should be_valid
			end
		end

		context "#with missing input" do
			it "should not create a new post without a title" do
				build(:post, title: nil).should_not be_valid
			end

			it "should not create a new post without an url" do
				build(:post, video_url: nil).should_not be_valid
			end

			it "should not create a new post without content" do
				build(:post, content: nil).should_not be_valid
			end

			it "should not create a new post without a user id" do
				build(:post, user: nil).should_not be_valid
			end
		end
	end

	describe 'attributes' do
		context "valid input" do

			it "should have a real video url"

		end

		context "invalid input" do
			pending
		end
	
		context "parse youtube url to grab the unique code" do
			it "should parse the youtube.com url" do
				post = build(:post, :video_url => "http://www.youtube.com/watch?v=vJmtOp5yajI")
				url = post.video_url
				post.parse_youtube_unique_code(url).should eq("vJmtOp5yajI")
			end
			
			it "should parse the youtu.be url" do
				post = build(:post, :video_url => "http://youtu.be/payDsNKcRKQ")
				post.parse_youtube_unique_code("http://youtu.be/payDsNKcRKQ").should eq("payDsNKcRKQ")
			end
		end


		end





	end



