require 'fcm'

class PushNotifications
  
  @fcm_client = FCM.new(ENV['FIRE_BASE_SEVER_KEY'])

  class << self
    
    def send(topics, message)
      data = {message: message}         
      @fcm_client.send_to_topic_condition(topics, data)
    end

  end
end