class PartsController < ApplicationController
    before_action :authenticate_user!

  def show
    @car = Car.find(params[:car_id])
    @part = Part.find(params[:id])
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
    part = Part.find(params[:id])
    car = Car.find(params[:car_id])
    part.update(part_params)
    redirect_to car_part_path
  end

  def destroy
    part = Part.find(params[:id])
    part.destroy
    redirect_to request.referrer
  end

  private

  def part_params
    params.require(:part).permit(:name, :introduction, :car_id)
  end
end