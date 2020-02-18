class Admin::UsersController < ApplicationController
    #before_action :authenticate_admin!
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @car = @user.cars
        @cars = Car.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def search
    if params[:name].present?
        @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
        @users = User.all
    end
    end

    private
    def user_params
    params.require(:user).permit(:name)
    end
end
