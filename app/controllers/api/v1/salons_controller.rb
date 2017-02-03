class Api::V1::SalonsController < ApplicationController
  before_action :set_salon, only: [:update, :show, :destroy, :stylists]

  def index
    salons = Salon.where(nil)
    salons = salons.near([params[:latitude], params[:longitude]], params[:radius]) if (params[:latitude] && params[:longitude] && params[:radius])
    salons = salons.where("name ilike ?", "%#{params[:q]}%")
    users = salons.map(&:owner).compact
    users = Kaminari.paginate_array(users).page(params[:page]).per(20)
    render json: users.empty? ? {users: []} : users, meta: pagination_dict(users), each_serializer: UserNestedSerializer
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

  def stylists
    render json: @salon.users
  end

  private

  def set_salon
    @salon = Salon.find(params[:id])
  end

  def salon_params
    params.require(:salon).permit(:name, :info, :address, :city, :state, :zip, :website, :phone)
  end
end
