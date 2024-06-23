class AuthenticationTokenService
  HMAC_SECRET = Rails.application.secrets.secret_key_base
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call(user_id)
    exp = 24.hours.from_now.to_i
    payload = { user_id: user_id, exp: exp }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    begin
      decoded_payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: JWT::Algorithm::HS256 })
      # Access decoded information (e.g., user ID, expiration time)
      return decoded_payload
    rescue JWT::DecodeError => e
      Rails.logger.error "JWT Decode Error: #{e.message}"
      return { error: 'Invalid token' }
    rescue JWT::ExpiredSignature => e
      Rails.logger.error "JWT Expired Signature: #{e.message}"
      return { error: 'Token expired' }
    end
  end

  def self.valid_payload(payload)
    !expired(payload)
  end

  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end

  def self.expired_token
    render json: { error: 'Expired token! login again' }, status: :unauthorized
  end
end
