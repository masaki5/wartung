class UsersController < ApplicationController
    def index
    end

    def show
        @user = User.find(params[:id])
        @cars = current_user.cars.all
    end

    def edit

    end

    def update

    end

    private

    def user_params
       params.require(:user).permit(:name)
    end

end
