class Admin::PartsController < ApplicationController
    before_action :authenticate_admin!

  def index
    @parts = Part.all
    @part = Part.where(params[:id])
  end


  def show
    @user = User.find(params[:user_id])
    @car = Car.find(params[:car_id])
    @part = Part.find(params[:id])
    @log = Log.new
    @logs = @part.logs.order(exchange: :desc).page(params[:page]).per(3)
  end

  def edit
    @car = Car.find(params[:car_id])
    @part = Part.find(params[:id])
  end


  def create
    car = Car.find(params[:car_id])
    part = car.parts.new(part_params)
    part.car_id = car.id
    part.save
    @parts = car.parts.page(params[:page]).per(5)
    redirect_to request.referrer
  end


  def update
    part = Part.find(params[:id])
    #car = Car.find(params[:car_id])
    part.update(part_params)
    redirect_to request.referrer
  end


  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to request.referrer
  end

  private

    def part_params
      params.require(:part).permit(:name, :introduction, :car_id)
    end
end
