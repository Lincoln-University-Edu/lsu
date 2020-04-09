class StudentWireChannel < ApplicationCable::Channel
  def subscribed
    stream_from "student_wire_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
