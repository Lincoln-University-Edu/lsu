class EntitiesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "entity_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
