class Api::V1::ProductsController < ApplicationController

  def index
    products = Product.where(nil)
    products = products.where("name ilike ?", "%#{params[:q]}%")
    render json: products.page(params[:page]).per(20)
  end

end
