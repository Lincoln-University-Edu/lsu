require 'fcm'

class PushNotifications
  class << self
    fcm_client = FCM.new(ENV['FIRE_BASE_SEVER_KEY'])

    def push_notification(message, title, registration_ids)
      options = { priority: 'high',
                  data: { message: message, icon: image },
                  notification: { body: message,
                                  title: title,
                                  sound: 'default',
                                  icon: 'image.png'
                                }
                }
                
      registration_ids.each_slice(20) do |registration_id|
        response = fcm_client.send(registration_id, options)
      end

    end
  end
end