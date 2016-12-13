class Api::V1::ServicesController < ApplicationController

  def index
    services = Service.where(nil)
    services = services.where(brand_id: params[:brand_id]) if params["brand_id"]
    services = services.page(params[:page]).per(20)
    render json: services, meta: pagination_dict(services)
  end

  def show
    render json: Service.find(params[:id])
  end

end
