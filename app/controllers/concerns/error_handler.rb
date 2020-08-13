module ErrorHandler
  extend ActiveSupport::Concern

  def parameter_missing(_e)
    render json: error({ "#{entity}": "#{entity} param is required"}), status: :bad_request
  end

  def routing_error
    render json: error('Not a valid API endpoint.'), status: :bad_request
  end

  private
    def error(message)
      { error:  message }.as_json
    end
end
