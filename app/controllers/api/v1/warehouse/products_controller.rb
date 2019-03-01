class Api::V1::Warehouse::ProductsController < ApplicationController
  before_action :authenticate_with_token!
  before_action :authorize_warehouse_user

  def index
    products = Product.order(created_at: :asc).paginate(pagination_params)
    success(data: products, meta: pagination_dict(products))
  end

  def create

  end

  def show
    success(data: @product, status: :success)
  end

  def update

  end


  private

  def product_params
    params.require(:product).permit(:name, :tag_id, :price, :quantity,
                                    :description, :short_description,
                                    :image_url, :link_url, :cloudinary_url,
                                    :product_brand_id, :is_trending,
                                    :product_image)
  end

  def authorize_warehouse_user
    authorize Product
  end

  def set_product
    @product = Product.find(params[:id])
  end
end