class SendPushNotificationsWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(topics, message)
    PushNotifications.send(topics, message)
  end
end