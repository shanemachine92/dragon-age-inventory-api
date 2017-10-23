require 'time'

class JsonWebToken
  def self.encode(payload, exp = Time.now.to_i + 1800)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue JWT::ExpiredSignature => e
    raise ExceptionHandler::ExpiredSignature, e.message
  end
end
