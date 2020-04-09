class BroadcastAcademicEventWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(academic_event)
    ActionCable.server.broadcast 'academic_event_channel', academic_event
  end
end