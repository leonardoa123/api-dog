class AuthController < ApplicationController

    #POST /auth/login
    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = JsonWebToken.jwt_encode(user_id: @user.id)
            render json: {token: token}, status: :ok
        else
            render json: {error 'Invalid username or password'}, status: :unauthorized
        end
    end
end
