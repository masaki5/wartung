class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @users = User.all.page(params[:page]).per(10)
    end

    def show
        @user = User.find(params[:id])
        @cars = @user.cars.page(params[:page]).per(5)
        @car = Car.new
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to admin_user_path
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
