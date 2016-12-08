class Api::V1::PostsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy, :index]
  before_action :set_post, only: [:update, :destroy]

  def index
    posts = Post.where(nil).order('created_at desc')
    posts = posts.popular if params[:popular]
    posts = post.favorites(current_user) if params[:favorites]
    render json: posts.page(params[:page]).per(20)
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      render json: post, status: 201
    else
      render json: { errors: post.errors }, status: 422
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, status: 201
    else
      render json: { errors: @post.errors }, status: 422
    end
  end

  def destroy
    @post.destroy
    head 204
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, labels_attributes: [:id, :_destroy, :post_id, :tag_id, :position_top, :position_left], formulas_attributes: [:id, :_destroy, :service_id, :time, :weight, :volume, :position_top, :position_left, :post_id, treatments_attributes: [:color_id, :weight, :id, :_destroy]])
  end

end
