class Api::V1::ServicesController < ApplicationController

  def index
    services = Service.where(nil)
    services.where(brand_id: params[:brand_id]) if params["brand_id"]
    render json: services.page(params[:page]).per(20)
  end

  def show
    render json: Service.find(params[:id])
  end

end
