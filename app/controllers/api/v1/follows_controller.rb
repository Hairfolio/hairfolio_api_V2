class Api::V1::FollowsController < ApplicationController
  before_action :set_user
  before_action :authenticate_with_token!, except: [:index]

  def create
    follow = Follow.new(follower: current_user, following: @user)
    if follow.save
      render json: current_user.following, status: 201
    else
      render json: { errors: follow.errors }, status: 422
    end
  end

  def destroy
    follow = Follow.find_by!(following: @user, follower: current_user)
    follow.destroy
    head 204
  end

  def index
    if params[:followings]
      users = @user.following.page(params[:page]).per(20)
    else
      users = @user.followers.page(params[:page]).per(20)
    end
    render json: users, meta: pagination_dict(users)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
