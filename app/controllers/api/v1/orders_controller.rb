class Api::V1::OrdersController < ApplicationController
	before_action :authenticate_with_token!

  	def create
  		order = Order.new
	  	order.user_id = @current_user.id
	  	order.status = 'pending'
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
	  		render json: order
	  	else
	  		render json: { message: "Error" }, status:201
	  	end
  	end

end
