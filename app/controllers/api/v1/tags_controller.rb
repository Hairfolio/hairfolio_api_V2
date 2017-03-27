class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :posts]

  def index
    tags = Tag.where(nil)
    tags = tags.where("name ilike ?", "%#{params[:q].gsub('#', '')}%")
    tags = tags.popular if params[:popular]
    tags = tags.page(params[:page]).per(3)
    render json: tags, meta: pagination_dict(tags)
  end

  def exact
    tag = Tag.find_by(name: params[:q])
    render json: tag
  end

  def show
    render json: @tag
  end

  def posts
    posts = Post.where(id: @tag.photos.pluck(:post_id)).order('created_at desc').page(params[:page]).per(8)
    render json: posts, meta: pagination_dict(posts)
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: tag, status: 201
    else
      render json: { errors: tag.errors}, status: 422
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
