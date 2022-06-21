class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_by_token

  private

  def authenticate_by_token
    return if authenticate_with_http_token { |token, _| AccessToken.valid?(token) }

    head :unauthorized
  end
end
