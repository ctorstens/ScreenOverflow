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

  def karma
    post_karma + comment_karma
  end

  def post_karma
    object_karma(self.posts).inject(:+)
  end

  def comment_karma
    object_karma(self.comments).inject(:+)
  end

  def object_karma(objects)    
    if objects.empty?
      objects_karma = [0]
    else
      objects_karma = objects.map{|object| object = (object.likes.size - object.dislikes.size)}
    end
  end

  def self.users_by_karma
    self.all.sort { |a,b| a.karma <=> b.karma }.reverse
  end
end
