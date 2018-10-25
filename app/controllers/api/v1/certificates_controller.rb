class Api::V1::CertificatesController < ApplicationController

  def index
    certificates = Certificate.all.page(params[:page]).order('position asc').per(params[:limit])
    render json: certificates, meta: pagination_dict(certificates)
  end

  def show
    render json: Certificate.find(params[:id])
  end
end
