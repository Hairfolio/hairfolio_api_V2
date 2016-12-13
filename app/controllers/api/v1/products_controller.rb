class Api::V1::ProductsController < ApplicationController

  def index
    products = Product.where(nil)
    products = products.where("name ilike ?", "%#{params[:q]}%")
    products = products.page(params[:page]).per(20)
    render json: products, meta: pagination_dict(products)
  end

end
