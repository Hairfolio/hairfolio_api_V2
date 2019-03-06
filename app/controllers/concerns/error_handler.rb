module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from Pundit::NotAuthorizedError, with: :not_authorized
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    end
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def not_authorized
    render json: { error: I18n.t('errors.not_authorized') }, status: :forbidden
  end

  def record_invalid(object)
    render json: { errors:  object.record.errors.full_messages }, status: :unprocessable_entity
  end
end