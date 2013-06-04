FactoryGirl.define do

  factory :post_with_comments, :parent => :post do
    after(:create) do |post|
      3.times do
        post.comments.create(comment: "This is dope")
      end
    end
  end
end
