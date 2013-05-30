
class PublicActivity::Model
  after_create :ping_client

  def ping_client
    Pusher.trigger('newsfeed_channel', 'event_name', '')
  end
end
