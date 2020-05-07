class AcademicEventChannel < ApplicationCable::Channel
  def subscribed
    stream_from "search_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
