class Api::V1::PostsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy, :index]
  before_action :set_post, only: [:update, :destroy]

  def index
    posts = Post.where(user: current_user.followers + User.where(id: current_user.id)).order('created_at desc')
    posts = posts.popular if params[:popular]
    posts = posts.favorites(current_user) if params[:favorites]
    posts = posts.page(params[:page]).per(20)
    render json: posts, meta: pagination_dict(posts)
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
    params.require(:post).permit(:description, videos_attributes: [:id, :_destroy, :asset_url, :post_id], photos_attributes: [:asset_url, :id, :_destroy, labels_attributes: [:id, :_destroy, :post_id, :tag_id, :label_type, :position_top, :position_left, formulas_attributes: [:id, :_destroy, :service_id, :time, :weight, :volume, :position_top, :position_left, :post_id, treatments_attributes: [:color_id, :weight, :id, :_destroy]]]])
  end

end
