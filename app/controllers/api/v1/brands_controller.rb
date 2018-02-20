class Api::V1::BrandsController < ApplicationController

  def index
    brands = Brand.all.page(params[:page]).per(8)
    brands = Service.find(params[:service_id]).brands if params["service_id"]
    render json: brands, includes: [:services]
  end

  def show
    render json: Brand.find(params[:id])
  end

end
