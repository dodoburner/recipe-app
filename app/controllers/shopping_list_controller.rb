class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventories])
    @recipe = Recipe.find(params[:recipe])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @inventory_foods = @inventory.inventory_foods.includes(:food)

    @missing_foods = []

    # @recipe_foods.each do |r_food|
    #   @inventory_foods.each do |i_food|
    #     if r_food.food.name == i_food.food.name
    #       @missing_food = r_food.food
    #       quantity = r_food.quantity - i_food.quantity
    #       @missing_food['quantity'] = quantity
    #       @missing_foods << quantity unless quantity <= 0
    #     end
    #   end
    # end
  end

  def new
    @inventories = User.find(current_user.id).inventories
    respond_to do |format|
      format.js
    end
  end
end