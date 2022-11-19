class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      flash[:success] = 'Food added successfully'
      redirect_to foods_path
    else
      flash.now[:error] = 'Error: Food could not be added'
      redirect_to new_food_path
    end
  end

  def destroy
    Food.find(params[:id]).destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
