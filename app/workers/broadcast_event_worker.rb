class BroadcastEventWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(event)
    ActionCable.server.broadcast 'event_channel', event
  end
end