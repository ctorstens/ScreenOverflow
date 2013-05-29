class UsersController < ApplicationController
	before_filter :signed_in_user

  
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def search
    render :json => User.all.map(&:name)
  end
    
end
