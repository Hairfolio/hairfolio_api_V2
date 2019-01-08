class Api::V1::SubCategoriesController < ApplicationController

  def index
    # user_id = User.where(auth_token:request.headers['Authorization']).map(&:id) 
    sub_categories = SubCategory.all.page(params[:page]).per(params[:limit])
    render json: sub_categories, meta: pagination_dict(sub_categories)
  end

  # def show
  #   @category = Category.find(params[:id])
  #   render json: @category
  # end

  

end
