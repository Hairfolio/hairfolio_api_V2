class Api::V1::OrdersController < ApplicationController
	before_action :authenticate_with_token!

  	def create  		  		
  		order = Order.new
	  	order.user_id = @current_user.id
	  	order.payment_status = "awaiting"
	  	order.order_number = "Ord#{DateTime.now.strftime("%Y%m%d%H%M")}"
	  	order.shipping_status = "pending"
	  	order.address_id = params[:address_id]
	  	
	  	if order.save	  		
	  		@cart_data = Cart.where(user_id: @current_user.id)	  		
	  		@cart_data.each do |value|
	  			order_details = OrderDetail.new
				order_details.order_id = order.id
				order_details.product_id = value.product_id
				order_details.quantity = value.quantity
				order_details.price = value.product.price
				
				order_details.save
	  		end
	  		render json: order, status:200
	  	else
	  		render json: { errors: "Error" }, status:422
	  	end
  	end

  	def user_orders
  		orders = Order.where(user_id: current_user.id)  		
  		orders = orders.where(shipping_status: params[:status])  		
  		if params[:status] == 'pending'
  			orders = orders.or(Order.where(shipping_status: "progress"))
  		end
  		orders = orders.page(params[:page]).per(params[:limit])

  		render json: orders, meta: pagination_dict(orders)
  	end

end
