class ChangePostTableUrlStorage < ActiveRecord::Migration
  def change
    remove_column :posts, :video_url
    add_column :posts, :video_url_code, :string, :null => false
    add_column :posts, :video_domain, :string, :null => false
  end
end
