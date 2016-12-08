class Api::V1::MessagesController < ApplicationController
  before_action :set_conversation

  def index
    render json: @conversation.messages
  end

  def show
    render json: @message
  end

  def update
    if @message.update(conversation_params)
      render json: @message, status: 201
    else
      render json: { errors: @message.errors }, status: 422
    end
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      render json: message, status: 201
    else
      render json: { errors: message.errors }, status: 422
    end
  end

  def destroy
    @message.destroy
    head 204
  end

  private

  def message_params
    params.require(:message).permit(:body, :post_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def set_messages
    @message = Message.find(params[:id])
  end
end
