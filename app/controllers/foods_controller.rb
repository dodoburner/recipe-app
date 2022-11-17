class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    @recipe = Recipe.find(params['recipe_id'])
  end

  def create
    @food = Food.new(food_params)
    @recipe = Recipe.find(params['recipe_id'])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe
    @recipe_food.food = @food

    if @food.save && @recipe_food.save
      flash[:success] = 'Food added successfully'
      redirect_to recipe_path(@recipe)
    else
      flash.now[:error] = 'Error: Food could not be added'
      redirect_to new_recipe_food_path
    end
  end

  def destroy
    Food.find(params[:id]).delete
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def recipe_food_params
    params.require(:food).permit(:quantity)
  end
end
