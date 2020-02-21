class Api::V2::HomeController < ApplicationController
  def index
    render json: { message: "Welcome!" }
  end

end
