class Api::V1::CartsController < ApplicationController
	
	before_action :authenticate_with_token!

	def index		
		@cart = Cart.where(user_id: current_user.id).order(created_at: :desc)
		render json: @cart, status:201
	end

	def create
		cart = Cart.where(product_id: cart_params[:product_id])
		cart = cart.where(user_id: current_user.id)

	    quantity = Product.where(id: cart_params[:product_id]).pluck(:quantity)[0]

		if cart_params[:quantity] > quantity
			render json: { errors: "Out Of Stock" }, status:422
		elsif !cart.empty?
			current_quantity = cart.pluck(:quantity)[0]
			cart.update(quantity: current_quantity + cart_params[:quantity] )
			render json: cart, status:201			
		else
			cart = Cart.new(cart_params)
			cart.user_id = current_user.id
			cart.quantity = cart_params[:quantity]
			cart.save			
			render json: cart, status:201
		end
	end
	
	def update_cart
		quantity = Product.where(id: cart_params[:product_id]).pluck(:quantity)[0]

		if cart_params[:quantity] > quantity
			render json: { errors: "Out Of Stock" }, status:422
		else
			cart = Cart.where(product_id: params[:product_id])
			cart = cart.where(user_id: current_user.id)			
			cart.update(quantity: params[:cart][:quantity])

			render json: cart, status:200
		end
	end


	def remove_from_cart
		cart = Cart.where(user_id: current_user.id).where(product_id: params[:product_id])
		if cart.delete_all == 1
			render json: { message: "Success" }, status:201
		else
			render json: { errors: "Error" }, status:422
		end
	end


	private
	def cart_params
		params.require(:cart).permit(:product_id, :quantity)
	end

end
