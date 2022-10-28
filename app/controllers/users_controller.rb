class UsersController < ApplicationController

    #GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end
    #GET /user/id
    def show
        @users = User.find(params[:id])
        render json: @user, status: :ok
    end
    def create 
        @user = User.new(user_params)
        if @user.active_storage_overview
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocesable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
