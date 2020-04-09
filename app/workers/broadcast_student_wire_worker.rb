class BroadcastStudentWireWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(student_wire)
    ActionCable.server.broadcast 'student_wire_channel', student_wire
  end
end