require 'jwt'
class TokenProvider
  def self.issue_token(user)
    payload = {:data => 'test'}

    JWT.encode payload, nil, 'none'
  end

  def self.valid?(token)
    begin
      decode(token)
    rescue decode_error, signature_error
      # IF this token is invalid, the JWT gem will raise this error and by caching it in this block
      # the returning valud should be false
      false
    end
  end

  private

  def decode(token)
    JWT.decode token, Rails.application.secrets.secret_key_base, 'HS256'
  end
end