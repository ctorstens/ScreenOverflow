class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :yt_client

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login(request)
  	auth = request.env["omniauth.auth"]
  	user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  	session[:user_id] = user.id 
  end

  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => ENV['GOOGLE_USERNAME'] , :password => ENV['GOOGLE_PASSWORD'], :dev_key => ENV['GOOGLE_DEV_KEY'])
  end

end


