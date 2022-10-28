class ApplicationController < ActionController::API

    include JsonWebToken
    before_action :autenticate_request

    private

    def autenticate_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded = jwt_decode(header)

        @current_user = User.find(decoded[:user_id])

    end

end
