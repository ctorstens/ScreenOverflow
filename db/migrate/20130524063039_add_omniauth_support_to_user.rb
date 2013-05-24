class AddOmniauthSupportToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :after => :username
    add_column :users, :image_url, :string, :after => :birthday
    add_column :users, :provider, :string, :after => :image_url
    add_column :users, :uid, :string, :after => :provider
    add_column :users, :google_token, :string, :after => :uid
  end
end



