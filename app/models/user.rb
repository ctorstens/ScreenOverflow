class User < ActiveRecord::Base
  has_many :posts
  has_many :votes
  has_many :comments

  attr_accessible :name, :email, :username, :image_url

  acts_as_voter

  def self.create_with_omniauth(auth)
    create! do |user|
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.image_url = auth["info"]["image"]      
      user.google_token = auth["credentials"]["token"]
      user.refresh_token = auth["credentials"]["refresh_token"]
      user.expires_at = auth["credentials"]["expires_at"]
      user.expires = auth["credentials"]["expires"]
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end

  def video_count
    self.posts.count
  end

end
