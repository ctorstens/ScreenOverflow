class Tag < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  has_and_belongs_to_many :posts
  attr_accessible :name

end

