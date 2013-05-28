class ChangePostTableThumbnail < ActiveRecord::Migration
  def change
    add_column :posts, :video_url_thumbnail, :string
    add_column :posts, :video_url_time, :string
  end
end
