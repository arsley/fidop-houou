require 'jwt'

class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :require_administrator_session

  private

  # cookies の expires は判定不要 : 期限が切れると対応するキーでのアクセスが nil になる
  def require_administrator_session
    head :unauthorized and return if cookies.encrypted[:session].blank?

    jwt = cookies.encrypted[:session]
    administrator_id =
      JWT.decode(jwt, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS512' })
         .yield_self { |parsed, _header| parsed['administrator_id'] }
    head :unauthorized and return unless Administrator.find_by(id: administrator_id)
  end
end
