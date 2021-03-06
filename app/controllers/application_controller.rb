class ApplicationController < ActionController::Base
  include PublicActivity::StoreController 
  protect_from_forgery

  helper_method :current_user
  helper_method :yt_client
  helper_method :signed_in_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login(request)
  	auth = request.env["omniauth.auth"]
  	user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    user.update_attributes(
      :name => auth["info"]["name"],
      :email => auth["info"]["email"],
      :first_name => auth["info"]["first_name"],
      :last_name => auth["info"]["last_name"],
      :image_url => auth["info"]["image"]
    )
  	session[:user_id] = user.id 
  end

  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => ENV['GOOGLE_USERNAME'] , :password => ENV['GOOGLE_PASSWORD'], :dev_key => ENV['GOOGLE_DEV_KEY'])
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      redirect_to root_url, notice: "Please sign in."
    end
  end

end


