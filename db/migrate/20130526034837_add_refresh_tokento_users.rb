class AddRefreshTokentoUsers < ActiveRecord::Migration
  def up
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
		add_column :users, :refresh_token, :string
		add_column :users, :expires_at, :integer
		add_column :users, :expires, :boolean

  end

  def down
  	remove_column :users, :first_name
  	remove_column :users, :last_name
  	remove_column :users, :refresh_token
  	remove_column :users, :expires_at
  	remove_column :users, :expires
  end
end
