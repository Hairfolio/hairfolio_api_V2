class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy, :show, :posts]
  def index
    users = User.where(nil)
    users = users.where(account_type: params[:account_type]) if params[:account_type]
    render json: users.page(params[:page]).per(20)
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: 201
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  def posts
    render json: @user.posts.order('created_at desc').page(params[:page]).per(20)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :account_type, :first_name, :last_name, :avatar_url, :avatar_cloudinary_id, :share_facebook, :share_twitter, :share_instagram, :share_pinterest, :share_tumblr, :prof_desc, :years_exp, :salon_id, :career_opportunity, salon_attributes: [:name, :info, :address, :city, :state, :zip, :website, :phone], educations_attributes: [:name, :year_from, :year_to, :degree_id, :user_id, :website, :id, :_destroy], offerings_attributes: [:user_id, :category_id, :service_id, :price, :id, :_destroy])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
