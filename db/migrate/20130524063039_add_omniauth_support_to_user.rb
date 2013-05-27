class AddOmniauthSupportToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :image_url, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :google_token, :string
  end
end

