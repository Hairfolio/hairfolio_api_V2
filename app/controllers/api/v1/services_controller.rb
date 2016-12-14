class Api::V1::ServicesController < ApplicationController

  def index
    services = Service.where(nil)
    services = Brand.find(params[:brand_id]).services if params["brand_id"]
    services = services.page(params[:page]).per(20)
    render json: services, meta: pagination_dict(services)
  end

  def show
    render json: Service.find(params[:id])
  end

end
