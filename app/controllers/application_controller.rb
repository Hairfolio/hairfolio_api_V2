class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from ActionController::ParameterMissing, :with => :invalid_parameters
  serialization_scope :view_context
  skip_before_action :verify_authenticity_token
  include ErrorHandler
  include Authenticable
  include Pundit

  private

  def pagination_dict(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page, # use object.previous_page when using will_paginate
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

  def pagination_params
    {
      per_page: params[:per_page] || 10,
      page: params[:page] || 1
    }
  end

  def success(data:, meta: nil,status: 201)
    render json: data, meta: meta, status: status
  end

  def errors(message:, status:)
    render json: { errors: message }, status: status

  end

  def invalid_parameters
    render json: { error: I18n.t('errors.param_invalid') }, status: :unprocessable_entity
  end
end
