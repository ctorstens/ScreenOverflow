class NotificationsController < ApplicationController

  def index
    @activities = PublicActivity::Activity.all.sort_by { |activity| activity }.reverse!
  end

end
