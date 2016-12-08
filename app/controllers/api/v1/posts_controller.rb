class Api::V1::PostsController < ApplicationController
  before_action :authenticate_with_token, only: [:create, :update, :destroy]

  def index
    posts = Post.where(nil).order('created_at desc')
    posts = posts.popular if params[:popular]
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
    params.require(:post).permit(:description)
  end

end
