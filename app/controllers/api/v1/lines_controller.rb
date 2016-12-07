class Api::V1::LinesController < ApplicationController

  def index
    lines = Line.where(nil)
    lines = lines.where(brand_id: params[:brand_id]) if params[:brand_id]
    render json: lines.page(params[:page]).per(20)
  end

end
