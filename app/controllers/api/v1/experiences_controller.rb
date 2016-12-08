class Api::V1::ExperiencesController < ApplicationController

  def index
    render json: Experience.all.page(params[:page]).order('position asc').per(20)
  end

end
