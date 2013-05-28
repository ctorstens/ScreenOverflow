require 'spec_helper'
require 'acts_as_votable'

describe Post do
	let(:user) {build(:user)}
	let(:post) {build(:post)}
	let(:post_with_tags) {create(:post_with_tags)}

	describe "can create a new post" do

		context "with valid input" do
			it "should create a new post with a long url" do
				post.should be_valid
			end

			it "should create a new post with a short url" do
				build(:post, :video_url => "http://youtu.be/7ZP-pBP59dg").should be_valid
			end
		end

		context "with missing input" do
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

		context "with invalid input" do
			it "should not create a new post with a non youtube url" do
				build(:post, :video_url => "http://www.codeschool.com/").should_not be_valid
			end

			it "should not create a new post with an invalid url" do
				build(:post, :video_url => "my name is jkai").should_not be_valid
			end
		end
	end

	describe 'methods' do
		
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

		context "invalid youtube url that looks like a valid url" do
			it "should not parse the url" do
				post = build(:post, :video_url => "http://www.google.com/watch?v=vJmtOp5yajI")
				url = post.video_url
				post.parse_youtube_unique_code(url).should_not eq("vJmtOp5yajI")
			end

			it "should not parse the shorten youtu.be url" do
				post = build(:post, :video_url => "http://crazy.be/payDsNKcRKQ")
				post.parse_video_url("http://crazy.be/payDsNKcRKQ").should_not eq("payDsNKcRKQ")
			end

			it "should return false to validate if the url is not youtube" do
				post = build(:post, :video_url => "http://www.yotube.com/watch?v=vJmtOp5yajI")
				post.youtube?("http://www.yotube.com/watch?v=vJmtOp5yajI").should eq(false)
			end				

			it "should return false to validate if the url is not youtu.be" do
				post = build(:post, :video_url => "http://crazy.be/payDsNKcRKQ")
				post.youtube?("http://crazy.be/payDsNKcRKQ").should eq(false)
			end				
		end
	end

  describe  "post with tags" do
    context "with valid tags" do
      it "should create new tags" do
        create(:post_with_tags).should be_valid
      end

      it "tag_list should have 3 length" do 
        post_with_tags.tag_list.length.should eq(3)
      end
    end
  end

  describe  "post with comment" do
    context "with valid comments" do
      it "should create new comment" do
        create(:post_with_comments).should be_valid
      end
    end
  end

   describe  "post with votes" do
   	let(:post) {create(:post)}
   	let(:user1) {create(:user)}
   	let(:user2) {create(:user)}

    context "can vote on post" do
      it "should allow users to upvote" do
        expect {post.liked_by(user1)}.to change{post.likes.size}.by(1)
      end

      it "should allow users to downvote" do
        expect {post.disliked_by(user1)}.to change{post.dislikes.size}.by(1)
      end
    end

    context "can unvote on post" do
    	it "should allow users to unvote" do
    		post.liked_by(user2)
    		expect {post.unliked_by :voter => user2}.to change{post.likes.size}.by(-1)
    	end

    	it "should allow users to unvote" do
    		post.disliked_by(user2)
    		expect {post.undisliked_by :voter => user2}.to change{post.dislikes.size}.by(-1)
    	end
    end

  end


end



