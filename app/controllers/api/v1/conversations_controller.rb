class Api::V1::ConversationsController < ApplicationController
  before_action :authenticate_with_token!
  before_action :set_conversation, except: [:index, :create]

  def index
    render json: Conversation.participant(current_user)
  end

  def show
    render json: @conversation.messages.order('created_at desc').page(params[:page]).per(20)
  end

  def update
    if @conversation.update(conversation_params)
      render json: @conversation, status: 201
    else
      render json: { errors: @conversation.errors }, status: 422
    end
  end

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save
      render json: conversation, status: 201
    else
      render json: { errors: conversation.errors }, status: 422
    end
  end

  def destroy
    @conversation.destroy
    head 204
  end

  private

  def conversation_params
    params.require(:conversation).permit(:sender_id, recipient_ids: [])
  end

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end
