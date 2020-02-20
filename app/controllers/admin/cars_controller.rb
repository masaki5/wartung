class Admin::CarsController < ApplicationController
    #before_action :set_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = Car.new
  end

  def show
    @car = Car.find(params[:id])
    @user = User.find(params[:user_id])
	  @part = Part.new
    @parts = @car.parts.page(params[:page]).per(5)
    @log = @car.logs
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
    redirect_to admin_user_path
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
