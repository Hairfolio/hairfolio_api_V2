# frozen_string_literal: true

module FirebaseCloudMessaging
  class NotificationSender

    attr_reader :message, :user_device_ids

    # Firebase works with up to 1000 device_ids per call
    MAX_USER_IDS_PER_CALL = 1000

    def initialize(user_device_ids, message)
      @user_device_ids = user_device_ids
      @message = message
    end

    def call
      user_device_ids.each_slice(MAX_USER_IDS_PER_CALL) do |device_ids|
        fcm_client.send(device_ids, options)
      end
    end

    private

    def options
      {
          priority: 'high',
          data: {
              message: message
          },
          notification: {
              body: message,
              sound: 'default'
          }
      }
    end

    def fcm_client
      @fcm_client ||= FCM.new(Rails.application.secrets.fcm_key)
    end
  end
end