class Admin::PartsController < ApplicationController


  def index
    @parts = Part.all
  end


  def show
    @part = Part.find(params[:id])
  end

  def new
    @part = Part.new
  end

  def edit
    @part = Part.find(params[:id])
  end


  def create
    part = Part.new(part_params)
    part.save
    redirect_to admin_parts_path(part.id)
  end


  def update
    part = Part.find(params[:id])
    part.update(part_params)
    redirect_to admin_parts_path
  end


  def destroy
    part = Part.find(params[:id])
    part.destroy
    redirect_to admin_parts_path, notice: "successfully delete book!"
  end

  private

    def part_params
      params.require(:part).permit(:name, :introduction)
    end
end
