class Api::V1::ExperiencesController < ApplicationController

  def index
    experiences = Experience.all.order('position asc').page(params[:page]).per(20)
    render json: experiences, meta: pagination_dict(experiences)
  end

end
