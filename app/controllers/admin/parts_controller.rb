class Admin::PartsController < ApplicationController


  def index
    @parts = Part.all
    @part = Part.where(params[:id])
  end


  def show
    @user = User.find(params[:user_id])
    @car = Car.find(params[:car_id])
    @part = Part.find(params[:id])
    @log = Log.new
    @logs = @part.logs
  end

  def new
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
      @parts = car.parts
      redirect_to request.referrer
  end


  def update
    part = Part.find(params[:id])
    part.update(part_params)
    redirect_to admin_parts_path
  end


  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to request.referrer, notice: "successfully delete book!"
  end

  private

    def part_params
      params.require(:part).permit(:name, :introduction, :car_id)
    end
end
