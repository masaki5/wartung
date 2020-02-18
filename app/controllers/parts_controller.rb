class PartsController < ApplicationController
    def index
    @part = Part.where(params[:id])
    end

    def show
      @car = Car.find(params[:car_id])
      @part = Part.find(params[:id])
      @log = Log.new
      @logs = @part.logs
    end

    def edit
      @car = Car.find(params[:car_id])
      @part = Part.find(params[:id])

    end

    def create
      @car = Car.find(params[:car_id])
      @part = @car.parts.new(part_params)
      @part.car_id = @car.id


      @parts = @car.parts.page(params[:page]).per(6)
      #@log = Log.where(params[:log_id])
      if @part.save
      @parts = car.parts
      redirect_to request.referrer
      else
        render "cars/show"
      end
    end

    def update
      part = Part.find(params[:id])
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