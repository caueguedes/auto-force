module ErrorHandler
  extend ActiveSupport::Concern

  def record_not_found(_e)
    render json: error( _e.message ), status: 404
  end

  def parameter_missing(_e)
    render json: error( _e.message ), status: 422
  end

  def routing_error
    render json: error('Not a valid API endpoint.'), status: 400
  end

  private
    def error(message)
      { error:  message }
    end
end
