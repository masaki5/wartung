class LogsController < ApplicationController
  #before_action :set_log, only: [:show, :edit, :update, :destroy]


  def index
    @logs = Log.all
  end

  def show
  end

  def new
	  #@car = Car.find(params[:car_id])
    @parts = Part.all
	  #@part = Part.new
	  #@parts = @car.parts
  end

  def edit
  end


  def create
  end


  def update
  end


  def destroy
  end

  private

    def log_params
      params.require(:log).permit(:car_id, :part_id)
    end
end
