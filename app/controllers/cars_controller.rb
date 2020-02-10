class CarsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = current_user.cars.all
  end

  def show
    @car = Car.find(params[:id])
    @partss = Part.all
	  @part = Part.new
	  @parts = @car.parts
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
    #part = car.parts.new(part_params)
    #part.car_id = car.id
    #part.save
    #Part.create(car_id: car.id, genre: '')
    redirect_to cars_path(car.id)
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    redirect_to cars_path
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
      params.require(:car).permit(:name)
    end
end
