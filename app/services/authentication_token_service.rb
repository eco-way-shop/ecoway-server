class AuthenticationTokenService
  HMAC_SECRET = 'aa0b2814d07c16e89487e90b8cb0578a1455b1793cd94d67f1ef8aa8a3c9d4ff1d3562a4280fb4018f5a458792b2e406fa46037cd9ad4c05a1af9b21ad33fa7d'
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call(user_id)
    exp = 24.hours.from_now.to_i
    payload = { user_id: user_id, exp: exp }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
  rescue JWT::ExpiredSignature, JWT::DecodeError
    false
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
