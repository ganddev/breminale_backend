require 'jwt'
class TokenProvider
  SECRET = Rails.application.secrets.secret_key_base.freeze

  def self.issue_token(user)
    payload = {
      user_id: user.id,
      user_email: user.email,
      exp: 1.day.from_now.to_i
    }
    JWT.encode payload, SECRET, 'HS256'
  end

  def self.valid?(token)
    JWT.decode token, SECRET, true, algorithm: 'HS256'
  rescue JWT::DecodeError, JWT::ImmatureSignature
    # IF this token is invalid, the JWT gem will raise this error and by
    # catching it in this block
    # the returning valud should be false
    false
  end

  def self.decode(token)
    JWT.decode token, SECRET, true, algorithm: 'HS256'
  rescue JWT::DecodeError, JWT::ImmatureSignature
    {}
  end
end
