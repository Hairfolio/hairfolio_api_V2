class Api::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all.page(params[:page]).per(params[:limit])
    render json: categories, meta: pagination_dict(categories)
  end

end
