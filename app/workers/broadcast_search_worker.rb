class BroadcastSearchWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(search_results, user_id)
    ActionCable.server.broadcast "search_channel_#{user_id}", search_results
  end
end