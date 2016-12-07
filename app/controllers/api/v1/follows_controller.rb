class Api::V1::FollowsController < ApplicationController
  before_action :set_user
  before_action :authenticate_with_token!

  def create
    follow = Follow.build(follower: current_user, followable: @user)
    if follow.save
      render json: current_user.follower_users, status: 201
    else
      render json: { errors: follow.errors }, status: 422
    end
  end

  def destroy
    follow = Follow.where(followable: @user, follower: current_user)
    follow.destroy
    head 204
  end

  def index
    if params[:followings]
      follows = Follow.where(follower: @user).page(params[:page]).per(20)
    else
      follows = Follow where(following: @user).page(params[:page]).per(20)
    end
    render json: follows
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
