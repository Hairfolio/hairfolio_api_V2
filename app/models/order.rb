class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :delivery_user, class_name: 'User'
  has_many :order_details
  has_many :push_notifications, foreign_key: :notifier_id
  has_one :payment_transaction, foreign_key: :performer_id
  enum payment_status: [:awaiting, :paid, :cancel]
  enum shipping_status: [:pending, :progress, :delivered]
  before_save :order_notification_flag, if: :set_notification_flag?
  after_commit :send_notification

  private

  def set_notification_flag?
    shipping_status_change = will_save_change_to_shipping_status? && shipping_status.in?(%w[progress delivered])
    payment_status_change = will_save_change_to_payment_status? && (payment_status == 'paid')
    shipping_status_change || payment_status_change
  end

  def order_notification_flag
    if will_save_change_to_shipping_status?
      if shipping_status == 'progress'
        @notification_for = 'order_in_progress'
      elsif shipping_status == 'delivered'
        @notification_for = 'order_delivered'
      end
    elsif will_save_change_to_payment_status? && payment_status == 'paid'
      @notification_for = 'order_confirmed'
    end
  end

  def send_notification
    return unless @notification_for

    notification = Notifications::OrderNotification.new(order: self, for_activity: @notification_for).generate
    ApplicationNotification.new(notification: notification).deliver if notification
  end
end
