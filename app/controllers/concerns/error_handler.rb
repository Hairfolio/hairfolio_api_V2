module ErrorHandler
  def self.includes(clazz)
    clazz.eval do
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    end
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end