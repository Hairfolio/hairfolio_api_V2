class Api::V1::HarmoniesController < ApplicationController

  def index
    harmonies = Harmony.where(nil)
    harmonies = harmonies.where(line_id: params[:line_id]) if params[:line_id]
    harmonies = harmonies.page(params[:page]).per(20)
    render json: harmonies, meta: pagination_dict(harmonies)
  end

end
