class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, :with => :parameter_missing

  private
    def parameter_missing(_e)
      entity = _e.param.to_s
      render json: { "#{entity}": "#{entity} param is missing"}, status: :unprocessable_entity
    end
end
