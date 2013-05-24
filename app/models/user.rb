class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  attr_accessible :first_name, :last_name, :name

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

end
