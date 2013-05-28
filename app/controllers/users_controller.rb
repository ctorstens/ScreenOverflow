class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def search
    render :json => Name.all.map(&:name)
  end
    
end
