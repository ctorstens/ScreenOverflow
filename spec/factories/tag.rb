FactoryGirl.define do
  factory :post_with_tags, :parent => :post do
    after(:create) do |post|
      post.tag_list = "html, css, ajax"
    end
  end
end
