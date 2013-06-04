class SessionsController < ApplicationController
  def create
    login request
    redirect_to posts_path, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
