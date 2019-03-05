# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_with_token!

  def index
    orders = Order.where(user_id: current_user.id)
    orders = orders.where(shipping_status: params[:status])
    if params[:status] == 'pending'
      orders = orders.or(orders.where(shipping_status: "progress"))
    end
    orders = orders.order('id asc')
    orders = orders.page(params[:page]).per(params[:limit])
    render json: orders, meta: pagination_dict(orders)
  end

  def create
    ActiveRecord::Base.transaction do
      order = Order.new(user_id: @current_user.id, payment_status: 'awaiting',
                        order_number: "Ord#{DateTime.now.strftime("%Y%m%d%H%M")}",
                        shipping_status: 'pending', address_id: params[:address_id])
      if order.save
        @cart_data = Cart.where(user_id: @current_user.id)
        @cart_data.each do |value|
          order_details = OrderDetail.new(order_id: order.id,
                                          product_id: value.product_id,
                                          quantity: value.quantity,
                                          price: value.product.price)
          order_details.save
        end
        notification = Notifications::OrderNotification.new(order: order, for_activity: 'order_created').generate
        ApplicationNotification.new(notification: notification).deliver if notification
        render json: order, status: 200
      else
        render json: { errors: 'Error' }, status: 422
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    render json: @order, status: 200
  end

end
