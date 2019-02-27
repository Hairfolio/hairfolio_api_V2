# frozen_string_literal: true
#
class NotificationSender
  attr_reader :message, :device_id, :title

  def initialize(device_id:, message:, title:)
    @device_id = device_id
    @message = message
    @title = title
  end

  def call
    begin
      resp = fcm_client.send(device_id, options)
      response_body = JSON.parse resp[:body].gsub('=>', ':')
      success = ParseBoolean.from_int_or_str(response_body.dig("success"))
      result =
        if success
          { sucess: true, resp_message: response_body["results"][0]["message_id"] }
        else
          { sucess: false, resp_message: response_body["results"][0]["error"] }
        end
      result
    rescue Exception => e
      Rails.logger.debug('Notification sending failed.')
    end
  end

  private

  def options
    { collapse_key: 'green',
      show_in_foreground: true,
      notification: {
        title: title,
        body: message,
        badge: 1
      },
      data: {} }
  end

  def fcm_client
    @fcm_client ||= FCM.new(Rails.application.secrets.fcm_server_key)
  end
end
