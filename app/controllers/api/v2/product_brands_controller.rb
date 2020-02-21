class Api::V2::ProductBrandsController < ApplicationController
  before_action :authenticate_with_token!, except: [:index]

  def index
    success(data: ProductBrand.all, status: 200)
  end
end

