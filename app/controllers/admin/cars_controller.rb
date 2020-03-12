class Admin::CarsController < ApplicationController
    before_action :authenticate_admin!

  def show
    @car = Car.find(params[:id])
    @user = User.find(params[:user_id])
	  @part = Part.new
    @parts = @car.parts.page(params[:page]).per(5)
    @log = @car.logs
    # 登録日経年計算
    d1 = @car.register.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    @age = (d2 - d1) /10000
    #残り点検日計算
    @now = Date.current
    v1 = @car.inspection
    @v1 = (v1 - @now).to_i
    #残り点検日計算
    v2 = @car.car_inspection
    @v2 = (v2 - @now).to_i
  end

  def edit
    @user = User.find(params[:user_id])
    @car = Car.find(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    car = Car.new(car_params)
    car.user_id = user.id
    car.save
    cars = user.cars
    redirect_to request.referrer
    # redirect_to admin_user_path(car.id)
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    redirect_to request.referrer
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to request.referrer
  end

  private
    def car_params
      params.require(:car).permit(:name, :mileage, :register, :inspection, :car_inspection)
    end
end
