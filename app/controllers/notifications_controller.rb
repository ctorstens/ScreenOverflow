class NotificationsController < ActionController::Base

  def index
    @activities = PublicActivity::Activity.all
  end

end
