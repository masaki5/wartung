class CarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cars = current_user.cars.all
  end

  def show
    @car = Car.find(params[:id])
    #@user = User.find(params[:user_id])
    #@partss = Part.find(params[:id])
    #したのは全パーツ持ってくる
    #@partss = Part.where(params[:id])
	  @part = Part.new
    @parts = @car.parts

    require 'date'
    now = Date.current
    #点検日
    v1 = @car.inspection
    #残り1年点検日数
    @v1 = (v1 - now).to_i
    #車検日
    v2 = @car.car_inspection
    #残り2年点検日数
    @v2 = (v2 - now).to_i
    #登録日経年数
    d1 = @car.register.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    @age = (d2 - d1) /10000

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
