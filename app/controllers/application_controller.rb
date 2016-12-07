class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  serialization_scope :view_context
  skip_before_action :verify_authenticity_token
  include Authenticable

  private

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end
