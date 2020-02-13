class Parts::LogsController < ApplicationController
  #before_action :set_log, only: [:show, :edit, :update, :destroy]


  def index
    @car = Car.find(params[:car_id])
    @logs = @car.logs
  end

  def show
    @log = Log.find(params[:id])
  end

  def new
    @log = Log.new
    @parts = Part.all
    @car = Car.find(params[:car_id])
    @part = Part.find(params[:part_id])
    #@part = Part.find(params[:part_id])
   # @parts = car.part
  end

  def edit
    @log = Log.find(params[:id])
  end


  def create
     part = Part.find(params[:part_id])
     car = Car.find(params[:car_id])
     log = car.logs.new(log_params)
     log.part_id = part.id
     log.save
     @logs = car.logs
     redirect_to request.referrer
  end

  def destroy
  end

  private

    def log_params
      params.require(:log).permit(:part_id, :exchange)
    end
  end
