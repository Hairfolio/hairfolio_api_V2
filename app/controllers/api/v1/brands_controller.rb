class Api::V1::BrandsController < ApplicationController

  def index
    brands = Brand.all.page(params[:page]).per(20)
    brands = Service.find(params[:service_id]).brands if params["service_id"]
    brands.page(params[:page]).per(20)
    render json: brands, meta: pagination_dict(brands)
  end

  def show
    render json: Brand.find(params[:id])
  end

end
