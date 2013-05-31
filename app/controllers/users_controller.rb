class UsersController < ApplicationController
	before_filter :signed_in_user

  
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.users_by_karma
  end

  # Review: Any real need for this as a separate route? What about including this in the #index
  # action and making #index support returning both HTML and JSON depending on the request?
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
