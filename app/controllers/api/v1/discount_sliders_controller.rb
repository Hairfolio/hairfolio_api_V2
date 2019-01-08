class Api::V1::DiscountSlidersController < ApplicationController
  
  def index
    @slider = DiscountSlider.all
    render json: @slider
  end

end
