class Api::V1::Warehouse::ProductsController < ApplicationController
  before_action :authenticate_with_token!
  before_action :authorize_warehouse_user
  before_action :set_product, only: %i[show update destroy]

  def index
    products = Product.order(created_at: :asc).paginate(pagination_params)
    success(data: products, meta: pagination_dict(products))
  end

  def create
    Product.create!(product_params)
    success(data: { message: I18n.t('products.create')}, status: 200)
  end

  def show
    success(data: @product, status: :success)
  end

  def update
    @product.update!(product_update_params)
    success(data: { message: I18n.t('products.update') }, status: 200)
  end

  def destroy
    @product.destroy!
    success(data: { message: I18n.t('products.destroy') }, status: 200)
  end


  private

  def product_params
    params.require(:product).permit(:name, :tag_id, :price, :quantity,
                                    :description, :short_description,
                                    :image_url, :link_url, :cloudinary_url,
                                    :product_brand_id, :is_trending,
                                    :product_image,
                                    product_galleries_attributes: [:image_url],
                                    category_ids: [])
  end

  def product_update_params
    params.require(:product)
          .permit(:name, :tag_id, :price, :quantity,
                  :description, :short_description,
                  :image_url, :link_url, :cloudinary_url,
                  :product_brand_id, :is_trending,
                  :product_image,
                  product_galleries_attributes: [:id, :image_url, :_destroy],
                  category_ids: [])
  end

  def authorize_warehouse_user
    authorize Product
  end

  def set_product
    @product = Product.find(params[:id])
  end
end