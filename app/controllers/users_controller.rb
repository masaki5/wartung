class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only:[:show, :edit, :update]

    def index
    end

    def show
        @cars = current_user.cars.page(params[:page]).per(8)
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to request.referrer
    end

    def set_article
    @user = User.find(params[:id])
    end

    private

    def user_params
       params.require(:user).permit(:name)
    end

end
