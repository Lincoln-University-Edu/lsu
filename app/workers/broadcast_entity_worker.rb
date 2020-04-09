class BroadcastEntityWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(entity)
    ActionCable.server.broadcast 'entity_channel', entity
  end
end