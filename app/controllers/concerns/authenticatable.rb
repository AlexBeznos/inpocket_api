module Authenticatable
  extend ActiveSupport::Concern

  included do
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate!
  end

  protected
  def authenticate!
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_device = Device.includes(:user).find_by(access_token: token)
      @current_user = @current_device.user
    end
  end

  def current_device
    @current_device
  end

  def current_user
    @current_user
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: { message: 'Incorrect auth token' }, status: :unauthorized
  end
end
