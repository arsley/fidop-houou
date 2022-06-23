require 'jwt'

class AccessToken < ApplicationRecord
  has_secure_token :token, length: 64
  has_secure_token :auth_token, length: 64

  belongs_to :administrator

  def self.valid?(jwt)
    return false if jwt.blank?

    payload, _header =
      JWT.decode(jwt, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS512' })
    return false unless payload['token'] && payload['auth_token']

    find_by(token: payload['token'], auth_token: payload['auth_token']).present?
  end

  def to_jwt
    payload = { administrator_id:, token:, auth_token: }
    JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS512')
  end
end
