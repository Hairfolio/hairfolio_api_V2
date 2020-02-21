class Api::V2::NotesController < ApplicationController
  before_action :authenticate_with_token!, only: [:index,:create,:update, :destroy]
  before_action :set_note, only: [:update, :destroy, :show]

  def index
    notes =  Note.where(contact_id: params[:contact_id]).order(id: :desc)
   notes = notes.page(params[:page]).per(params[:limit])
   render json: notes, meta: pagination_dict(notes)
  end

  def show
    render json: @note
  end

  def create
    note = Note.create(note_params)
    if note.save
      render json: note, status: 201
    else
      render json: { errors: note.errors }, status: 422
    end
  end

  def update
    if @note.update(note_params)
      render json: @note, status: 201
    else
      render json: { errors: @note.errors }, status: 422
    end
  end

  def destroy
   if @note.destroy
     render json: {"message": "deleted","status": 200}
   else
     render json: {"message": "error"}
   end
    # head 204
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:contact_id,:formula_note => [],:simple_note => [],products_attributes: [:id, :_destroy], product_ids:[], photos_attributes: [:asset_url, :video_url,:thumb_url, :id, :_destroy ])
  end
end
