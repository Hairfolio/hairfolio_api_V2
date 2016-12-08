class Api::V1::FoliosController < ApplicationController
  before_action :authenticate_with_token!

  def index
    render json: current_user.folios.page(params[:page]).per(20)
  end

  def create
    folio = current_user.folios.build(folio_params)
    if folio.save
      render json: folio, status: 201
    else
      render json: { errors: folio.errors }, status: 422
    end
  end

  def update
    folio = current_user.folios.find(params[:id])
    if folio.update(folio_params)
      render json: folio, status: 201
    else
      render json: { errors: folio.errors }, status: 422
    end
  end

  def destroy
    folio = current_user.folios.find(params[:id])
    folio.destroy
    head 204
  end

  private

  def folio_params
    params.require(:folio).permit(:name, post_ids: [])
  end

end