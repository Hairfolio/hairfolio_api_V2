class Api::V2::DiscountSlidersController < ApplicationController
  
  def index
    @slider = DiscountSlider.all.order(id: :desc).limit(1)
    render json: @slider
  end

end
