class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only:[:show, :edit, :update, :destroy]

  def index
    @cars = current_user.cars.page(params[:page]).per(5)
    @car = Car.new
  end

  def show
	  @part = Part.new
    @parts = @car.parts.page(params[:page]).per(5)
    @log = @car.logs
    # 登録日年計算
    d1 = @car.register.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    @age = (d2 - d1) /10000
    #残り点検日
    now = Date.current
    v1 = @car.inspection
    @v1 = (v1 - now).to_i
    #残り点検日
    v2 = @car.car_inspection
    @v2 = (v2 - now).to_i
  end

  def edit
  end

  def create
    car = Car.new(car_params)
    car.user_id = current_user.id
    car.save!
    @cars = current_user.cars.page(params[:page]).per(5)
    @car = Car.new
  end

  def update
    @car.update(car_params)
    redirect_to car_path
  end

  def destroy
    @car.destroy
    @cars = current_user.cars.page(params[:page]).per(5)
  end

  def set_article
  @car = Car.find(params[:id])
  end

  private
    def car_params
      params.require(:car).permit(:name, :mileage, :register, :inspection, :car_inspection)
    end
end
