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

    require 'date'
    now = Date.current
    year = now.next_year
    next_year = year - now
    #da = @car.inspection.to_s.split('-')
    #上ので日付分解
    #dead_line = Date(da[0], da[1] ,da[2])
    date = @car.inspection
    #dead_line = Date.new(2020, 7 ,6)
    @remain = (date - now).to_i
    @w = (@remain + next_year).to_i
    #@1year = now.next_year
    #dead_line = Date.new(2018, 7 ,6)vag
    #@remain = (@in - today).to_i
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
