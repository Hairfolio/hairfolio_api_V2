class Api::V1::CategoriesController < ApplicationController

  def index
    render json: Category.all.page(params[:page]).per(20)
  end

end
