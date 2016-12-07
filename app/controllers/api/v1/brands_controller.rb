class Api::V1::BrandsController < ApplicationController

  def index
    render json: Brand.all.page(params[:page]).per(20)
  end

  def show
    render json: Brand.find(params[:id])
  end

end
