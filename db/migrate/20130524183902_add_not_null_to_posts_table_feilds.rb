class AddNotNullToPostsTableFeilds < ActiveRecord::Migration
  def change
  	change_column(:posts, :title, :string, :null => false)
  	change_column(:posts, :video_url, :string, :null => false)
  	change_column(:posts, :content, :string, :null => false)
  end
end
