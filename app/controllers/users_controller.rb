class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def show
        @user = User.find(params[:id])
        @cars = current_user.cars.page(params[:page]).per(8)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to request.referrer
    end

    private

    def user_params
       params.require(:user).permit(:name)
    end

end
