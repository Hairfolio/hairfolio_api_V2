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
    product =
      Orders::CreationService.new(
                                current_user: @current_user,
                                address_params: order_address_params,
                                payment_params: order_payment_params
      ).call
    success(data: product)
  end

  def show
    @order = Order.find(params[:id])
    render json: @order, status: 200
  end

  private

  def order_address_params
    params.require(:address_params).permit(:address_id)
  end

  def order_payment_params
    params.require(:payment_params).permit(:card_id)
  end

end
