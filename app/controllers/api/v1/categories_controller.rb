class Api::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all.page(params[:page]).per(20)
    render json: categories, meta: pagination_dict(categories)
  end

end
