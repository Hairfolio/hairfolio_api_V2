class Api::V1::CertificatesController < ApplicationController

  def index
    render json: Certificate.all.page(params[:page]).order('position asc').per(20)
  end

  def show
    render json: Certificate.find(params[:id])
  end
end
