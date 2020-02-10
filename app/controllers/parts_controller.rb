class PartsController < ApplicationController
    def index
    @part = Part.where(params[:id])
    end

    def show
      @car = Car.find(params[:car_id])
      @part = Part.find(params[:id])
      #@parts = car.part
      #@part = @cars.parts
    end

    def edit
      @car = Car.find(params[:car_id])
      @part = Part.find(params[:id])

    end

    def new
      @part = Part.new
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
      redirect_to car_part_path
    end

    def destroy
      part = Part.find(params[:id])
      part.destroy
      redirect_to parts_path
    end

    private

    def part_params
      params.require(:part).permit(:name, :introduction, :car_id)
    end
end