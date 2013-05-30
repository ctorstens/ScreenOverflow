class NotificationsController < ApplicationController

  def index
    @activities = PublicActivity::Activity.all.sort_by { |activity| activity }.reverse!
  end

  def index_no_layout
    @activities = PublicActivity::Activity.all.sort_by { |activity| activity }.reverse!

    Pusher.trigger('newsfeed_channel', 'event_name', {some:  @activities })
    render :index, :layout => false
  end

end
