class AcademicEventChannel < ApplicationCable::Channel
  def subscribed
    stream_from "academic_event_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
