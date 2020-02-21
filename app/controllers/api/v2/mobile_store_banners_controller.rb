class Api::V2::MobileStoreBannersController < ApplicationController

  def index
    mobile_banners = MobileStoreBanner.where(status: "active")
    mobile_banners = mobile_banners.where("name ilike ?","#{params[:name]}%") if params[:name]
    render json: {mobile_store_banners: mobile_banners}
  end
end
