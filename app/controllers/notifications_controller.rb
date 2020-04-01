class NotificationsController < ApplicationController
  def push_notifications
    message = params[:message]
    topics = params[:topics]
    SendPushNotificationsWorker.perform_async(topics, message)
  end
end