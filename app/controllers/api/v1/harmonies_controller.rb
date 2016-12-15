class Api::V1::HarmoniesController < ApplicationController

  def index
    harmonies = Harmony.where(nil)
    harmonies = harmonies.where(line_id: params[:line_id]) if params[:line_id]
    render json: harmonies
  end

end
