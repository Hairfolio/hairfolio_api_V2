class Api::V1::CartsController < ApplicationController
	
	before_action :authenticate_with_token!

	def increase		
		cart = Cart.where(product_id: cart_params[:product_id])
		cart = cart.where(user_id: current_user.id)
		
		if !cart.empty?
			current_quantity = cart.pluck(:quantity)[0]
			cart.update(quantity: current_quantity + 1 )
			render json: cart, status:201
		else
			cart = Cart.new(cart_params)
			cart.user_id = current_user.id
			cart.quantity = 1			
			cart.save
			render json: cart, status:201
		end
	end

	def decrease
		cart = Cart.where(product_id: cart_params[:product_id])
		cart = cart.where(user_id: current_user.id)		
		
		current_quantity = cart.pluck(:quantity)[0]

		if current_quantity > 1
			cart.update(quantity: current_quantity - 1 )
			render json: cart, status:201	
		else
			render json: { errors: "Invalide quantity" }, status: 422
		end
	end

	
	def update
		quantity = Product.where(id: params[:cart][:product_id]).pluck(:quantity)[0]

		if params[:cart][:quantity] > quantity			
			render json: { errors: "Out Of Stock" }, status:422
		else
			cart = Cart.where(product_id: params[:product_id])
			cart = cart.where(user_id: current_user.id)			
			cart.update(quantity: params[:cart][:quantity])

			render json: cart, status:200
		end
	end


	def cart		
		@cart = Cart.where(user_id: current_user.id)
		render json: @cart, status:201
	end

	def remove
		cart = Cart.where(user_id: current_user.id).where(product_id: params[:product_id])
		if cart.delete_all == 1
			render json: { message: "Success" }, status:201
		else
			render json: { errors: "Error" }, status:422
		end
	end


	private
	def cart_params
		params.require(:cart).permit(:product_id)
	end

end
