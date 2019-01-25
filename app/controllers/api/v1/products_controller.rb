class Api::V1::ProductsController < ApplicationController  
  before_action :logged_in  
  def index    
    products = Product.where(nil)
    products = products.where("name ilike ?", "%#{params[:q]}%")
    products = products.page(params[:page]).per(params[:limit]).order('id DESC')
    render json: products, user_id: current_user.id, meta: pagination_dict(products)
  end

  def show    
    @product = Product.find(params[:id])
    render json: @product, user_id: current_user.id
  end

  def trending_products
    trending_products = Product.where(is_trending: true)
    render json:  trending_products
  end

end
