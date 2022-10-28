require "jwt"

module JsonWebToken

    extend ActiveSupport::Concern

    SECRET_KEY = Rails.application.secrets.secret_key_base

    def jwt_encode(payload)
        JWT.encode(payload,SECRET_KEY)

    end
    def jwt_decode(token)
        decoded = JWT.decode(token, SECRET_KEY)[0]
    end
    
end