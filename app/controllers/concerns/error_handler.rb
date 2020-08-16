module ErrorHandler
  extend ActiveSupport::Concern

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
