class Api::V1::SalonsController < ApplicationController
  before_action :set_salon, only: [:update, :show, :destroy]

  def index
    salons = Salon.where(nil)
    salons = salons.near([params[:latitude], params[:longitude]], params[:radius]) if (params[:latitude] && params[:longitude] && params[:radius])
    salons = salons.where("name ilike ?", "%#{params[:q]}%")
    render json: salons.page(params[:page]).per(20)
  end

  def show
    render json: @salon
  end

  def create
    salon = Salon.new(salon_params)
    if salon.save
      render json: salon, status: 201
    else
      render json: { errors: salon.errors }, status: 422
    end
  end

  def update
    if @salon.update(salon_params)
      render json: @salon, status: 201
    else
      render json: { errors: @salon.errors }, status: 422
    end
  end

  def destroy
    @salon.destroy
    head 204
  end

  private

  def set_salon
    @salon = Salon.find(params[:id])
  end

  def salon_params
    params.require(:salon).permit(:name, :info, :address, :city, :state, :zip, :website, :phone)
  end
end
