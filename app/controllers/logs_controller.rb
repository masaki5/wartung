class LogsController < ApplicationController
  #before_action :set_log, only: [:show, :edit, :update, :destroy]


  def index
    @car = Car.find(params[:car_id])
    @logs = Log.where(params[:id])
    #@parts = Part.find(params[:part_id])
    @part = @car.parts
    @log = @car.logs
  end

  def show
    @log = Log.find(params[:id])
    @car = Car.find(params[:car_id])
    @part = @car.parts
    @logs = @log.part
  end

  def new
    @log = Log.new
    @car = Car.find(params[:car_id])
    @part = Part.where(part_id: params[:part_id])
    @parts = @car.parts
  end

  def edit
    @log = Log.find(params[:id])
  end


  def create

    #part = Part.find(params[:part_id])
    car = Car.find(params[:car_id])
    log = car.logs.new(log_params)
    log.save
    @logs = car.logs
    redirect_to root_path
  end


  def update
  end


  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to request.referrer
  end

  private

    def log_params
      params.require(:log).permit(:part_id)
    end
end
