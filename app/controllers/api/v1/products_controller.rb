class Api::V1::ProductsController < ApplicationController

  def index
    products = Product.where(nil)
    products = products.where("name ilike ?", "%#{params[:q]}%")
    products = products.page(params[:page]).per(params[:limit])
    
    render json: products, meta: pagination_dict(products)
  end

end
