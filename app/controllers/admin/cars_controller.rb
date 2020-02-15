class Admin::CarsController < ApplicationController
    #before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    #userのcar探す
    @car = Car.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @car = Car.find(params[:id])
    @user = User.where(user_id: params[:user_id])
    @part = Part.new
    @parts = @car.parts

    require 'date'
    now = Date.current
    #点検日
    v1 = @car.inspection
    #残り1年点検日数
    @v1 = (v1 - now).to_i
    #車検日
    v2 = @car.car_inspection
    #残り2年点検日数
    @v2 = (v2 - now).to_i
    #登録日経年数
    d1 = @car.register.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    @age = (d2 - d1) /10000
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:name)
    end
end