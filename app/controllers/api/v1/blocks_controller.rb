class Api::V1::BlocksController < ApplicationController
  before_action :set_user
  before_action :authenticate_with_token!, except: [:index]

  def create
    follow = Follow.find_by(following: @user, follower: current_user)
    block = Block.new(blocker: current_user, blocking: @user)
    follow.destroy if follow
    block.save
    render json: current_user.blocking.uniq, status: 201, root: 'users', each_serializer: UserMinimalSerializer
  end

  def destroy
    block = Block.find_by!(blocking: @user, blocker: current_user)
    block.destroy
    head 204
  end

  def index
    users = Kaminari.paginate_array(@user.blocking.uniq).page(params[:page]).per(8)
    render json: users, meta: pagination_dict(users), root: 'users', each_serializer: UserMinimalSerializer
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
