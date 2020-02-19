class CarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cars = current_user.cars.all
  end

  def show
    @car = Car.find(params[:id])
    @partss = Part.find(params[:id])
	  @part = Part.new
    @parts = @car.parts.page(params[:page]).per(6)
    @log = @car.logs
  end

  def new
    @car = Car.new
  end

  def edit
      @car = Car.find(params[:id])
  end

  def create
    car = Car.new(car_params)
    car.user_id = current_user.id
    car.save
    redirect_to cars_path(car.id)
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    redirect_to car_path
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to cars_path
  end

  private
    def car_params
      params.require(:car).permit(:name, :mileage, :register, :inspection, :car_inspection)
    end
end
