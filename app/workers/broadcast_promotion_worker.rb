class BroadcastPromotionWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(promotion)
    ActionCable.server.broadcast 'promotion_channel', promotion
  end
end