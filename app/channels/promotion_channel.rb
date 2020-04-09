class PromotionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "promotion_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
