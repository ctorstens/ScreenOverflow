class UsersController < ApplicationController
	before_filter :signed_in_user

  
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def search
    @users = User.all.map do |u|
      {
        :value => u.name,
        :url => user_path(u)
      }
    end
    render :json => @users
  end
    
end
