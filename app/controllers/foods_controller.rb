class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def create
    @food = Food.create(food_params)
    if @food.save
      flash[:success] = 'Food added successfully'
      redirect_to foods_path
    else
      flash.now[:error] = 'Error: Food could not be added'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
