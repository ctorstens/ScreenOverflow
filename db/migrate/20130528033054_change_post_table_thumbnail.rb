class ChangePostTableThumbnail < ActiveRecord::Migration
  def change
    add_column :posts, :video_url_thumbnail, :string
  end
end
