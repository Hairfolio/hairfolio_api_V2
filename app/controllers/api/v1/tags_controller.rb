class Api::V1::TagsController < ApplicationController
  
  def index
    tags = Tag.where(nil)
    tags = tags.where("name ilike ?", "%#{params[:q]}%")
    render json: tags.page(params[:page]).per(20)
  end

end
