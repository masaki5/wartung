class PartsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only:[:show, :edit, :update, :destroy]

  def show
    @car = Car.find(params[:car_id])
    @log = Log.new
    @logs = @part.logs.order(exchange: :desc).page(params[:page]).per(3)
  end

  def create
    car = Car.find(params[:car_id])
    part = car.parts.new(part_params)
    part.car_id = car.id
    parts = car.parts.page(params[:page]).per(5)
    part.save
    redirect_to car_path(car)
  end

  def update
    car = Car.find(params[:car_id])
    @part.update(part_params)
    redirect_to car_part_path
  end

  def destroy
    @part.destroy
    redirect_to request.referrer
  end

  def set_article
  @part = Part.find(params[:id])
  end

  private

  def part_params
    params.require(:part).permit(:name, :introduction, :car_id)
  end
end