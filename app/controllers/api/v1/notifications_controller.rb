class Api::V1::NotificationsController < ApplicationController
  before_action :authenticate_with_token!

  def index
    notifications = Notification.where(nil).order('created_at desc')
    notifications = params[:followers] ? notifications.followers(current_user) : current_user.notifications
    render json: notifications.page(params[:page]).per(20)
  end

  def show
    notification = current_user.notifications.find(params[:id])
    render json: notification
  end

end
