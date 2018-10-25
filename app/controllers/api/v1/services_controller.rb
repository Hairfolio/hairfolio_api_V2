class Api::V1::ServicesController < ApplicationController

  def index
    services = Service.where(nil)
    services = Brand.find(params[:brand_id]).services if params["brand_id"]
    render json: services
  end

  def show
    render json: Service.find(params[:id])
  end

end
