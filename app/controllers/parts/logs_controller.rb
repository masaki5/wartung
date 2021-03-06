class Parts::LogsController < ApplicationController

  def index
  end

  def show
    @log = Log.find(params[:id])
    @car = Car.find(params[:car_id])
    @part = @car.parts
    @logs = @log.part
  end

  def new
    @log = Log.new
    @parts = Part.all
    @car = Car.find(params[:car_id])
    @part = Part.find(params[:part_id])
  end

  def edit
     @log = Log.find(params[:id])
     @car = Car.find(params[:car_id])
  end

  def create
     part = Part.find(params[:part_id])
     car = Car.find(params[:car_id])
     log = car.logs.build(log_params)
     log.part_id = part.id
     log.distance = car.mileage
     log.save
     @logs = car.logs
     redirect_to request.referrer
  end

  def update
     part = Part.find(params[:part_id])
     car = Car.find(params[:car_id])
     log = Log.find(params[:id])
     log.update(log_params)
     redirect_to cars_logs_path
  end

  def destroy
      log = Log.find(params[:id])
      log.destroy
      redirect_to request.referrer
  end

  private

    def log_params
      params.require(:log).permit(:part_id, :exchange, :next, :after, :distance)
    end
  end
