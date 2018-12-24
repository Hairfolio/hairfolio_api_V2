class Api::V1::CartsController < ApplicationController
	
	before_action :authenticate_with_token!

	def increase		
		cart = Cart.where(product_id: cart_params[:product_id])
		cart = cart.where(user_id: current_user.id )
		
		if !cart.empty?
			current_quantity = cart.pluck(:quantity)[0]
			cart.update(quantity: current_quantity + 1 )

			render json: cart, status:200
		else
			cart = Cart.new(cart_params)
			cart.user_id = current_user.id
			cart.quantity = 1			
			cart.save

			render json: cart
		end
	end

	def decrease		
		cart = Cart.where(product_id: cart_params[:product_id])
		cart = cart.where(user_id: current_user.id)		
		current_quantity = cart.pluck(:quantity)[0]		

		if current_quantity > 1
			cart.update(quantity: current_quantity - 1 )

			render json: cart, status:200	
		else
			render json: { message: "Invalide quantity", status:201 }
		end
	end

	def cart		
		@cart = Cart.where(user_id: current_user.id)		
		render json: @cart
	end

	def remove
		cart = Cart.where(user_id: current_user.id).where(product_id: params[:product_id])
		if cart.delete_all == 1
			render json: "true"
		else
			render json: "false"
		end
	end

	def cart_params
		params.require(:cart).permit(:product_id)
	end

end
