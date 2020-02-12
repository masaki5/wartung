class CarsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = current_user.cars.all
  end

  def show
    @car = Car.find(params[:id])
	  @part = Part.new
    @parts = @car.parts
    #@inspection = Date.parse(@car.inspection)

    ＠cars = @car.register
    @today = Date.today
    @last_day = Date.new(@today.year, @today.month, -1)
    #@carss = Date.parse(@car)

    #@age = (Date.today.strftime(date_format).to_i -@cars.strftime(date_format).to_i) / 10000

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
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:name, :mileage, :register, :inspection)
    end
end
