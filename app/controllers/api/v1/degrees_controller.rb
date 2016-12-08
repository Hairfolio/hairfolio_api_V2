class Api::V1::DegreesController < ApplicationController

  def index
    render json: Degree.all.page(params[:page]).order('position asc').per(20)
  end

  def show
    render json: Degree.find(params[:id])
  end
end
