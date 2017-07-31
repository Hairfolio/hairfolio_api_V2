class Api::V1::BlocksController < ApplicationController
  before_action :set_user
  before_action :authenticate_with_token!, except: [:index]

  def create
    block = Block.new(blocker: current_user, blocking: @user)
    block.save
    render json: current_user.blocker.uniq, status: 201, root: 'users', each_serializer: UserMinimalSerializer
  end

  def destroy
    block = Block.find_by!(blocking: @user, blocker: current_user)
    block.destroy
    head 204
  end

  def index
    users = Kaminari.paginate_array(@user.blocker.uniq).page(params[:page]).per(8)
    render json: users, meta: pagination_dict(users), root: 'users', each_serializer: UserMinimalSerializer
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
