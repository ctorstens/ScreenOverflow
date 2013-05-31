require 'spec_helper'

describe Tag do
  let(:user) {build(:user)}
  let(:post) {build(:post)}
  let(:post_with_tags) {create(:post_with_tags)}

  describe  "post with tags" do
    context "with valid tags" do
      it "should create new tags" do
        create(:post_with_tags).should be_valid
      end

      it "tag_list should have 3 length" do
        # Review: These types of assertions that depend on the FactoryGirl setup are
        # opaque. I'd prefer to see the post with tags build up right here in the test.
        post_with_tags.tag_list.length.should eq(3)
      end
    end
  end
end
