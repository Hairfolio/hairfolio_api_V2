class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_with_token!
  before_action :set_conversation
  before_action :set_message, only: [:show, :update, :destroy, :read]

  def index
    messages = @conversation.messages.order('created_at desc').page(params[:page]).per(20)
    render json: messages, meta: pagination_dict(messages)
  end

  def show
    render json: @message
  end

  def update
    if @message.update(message_params)
      render json: @message, status: 201
    else
      render json: { errors: @message.errors }, status: 422
    end
  end

  def create
    message = current_user.messages.build(message_params)
    message.conversation = @conversation
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

  def read
    @message.update(read: true)
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:body, :url, :post_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
