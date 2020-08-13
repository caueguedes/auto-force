class ApplicationController < ActionController::API
  include ErrorHandler

  rescue_from ActionController::ParameterMissing, with: :parameter_missing
end
