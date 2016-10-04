class ApplicationController < ActionController::Base
  include Authenticatable

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  protected

  def record_invalid(errors)
    h = {
      message: 'Validation Failed',
      errors: errors
    }

    render json: h, status: :unprocessable_entity
  end

  private

  def record_not_found
    render json: { message: 'Not Found' }, status: :not_found
  end

  def parameter_missing
    render json: { message: 'Bad Request' }, status: :unprocessable_entity
  end
end
