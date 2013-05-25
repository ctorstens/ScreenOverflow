class User < ActiveRecord::Base
  has_many :posts
  has_many :votes
  has_many :comments

  attr_accessible :name, :email, :username

  acts_as_voter

  def self.create_with_omniauth(auth)
    create! do |user|
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.image_url = auth["info"]["image"]
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.google_token = auth["credentials"]["token"]
    end
  end

  def video_count
    self.posts.count
  end

end
