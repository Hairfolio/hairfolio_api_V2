class Api::V1::FoliosController < ApplicationController
  before_action :authenticate_with_token!
  before_action :set_folio, only: [:posts]

  def index
    folios = current_user.folios.order('created_at desc').page(params[:page]).per(20)
    render json: folios, meta: pagination_dict(folios)
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

  def posts
    posts = @folio.posts.order('created_at desc').page(params[:page]).per(10)
    render json: posts, meta: pagination_dict(posts)
  end

  private

  def set_folio
    @folio = Folio.find(params[:id])
  end

  def folio_params
    params.require(:folio).permit(:name, post_ids: [])
  end

end
