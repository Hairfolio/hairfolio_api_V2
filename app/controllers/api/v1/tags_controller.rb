class Api::V1::TagsController < ApplicationController

  def index
    tags = Tag.where(nil)
    tags = tags.where("name ilike ?", "%#{params[:q]}%")
    tags = tags.page(params[:page]).per(20)
    render json: tags, meta: pagination_dict(tags)
  end

  def show
    tag = Tag.find(params[:id])
    render json: tag
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

  def tag_params
    params.require(:tag).permit(:name, :url)
  end

end
