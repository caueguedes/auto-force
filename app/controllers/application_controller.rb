class ApplicationController < ActionController::API
  include ErrorHandler

  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
end
