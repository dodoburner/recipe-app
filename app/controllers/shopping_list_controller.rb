class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventories])
    @recipe = Recipe.find(params[:recipe])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @inventory_foods = @inventory.inventory_foods.includes(:food)

    @missing_foods = []
    @total_value = 0

    @recipe_foods.each do |r_food|
      @has_food = false
      @inventory_foods.each do |i_food|
        if r_food.food.name == i_food.food.name
          @has_food = true
          quantity = r_food.quantity - i_food.quantity
          price = r_food.food.price.to_f / r_food.quantity
          price_for_missing_quantity = (quantity * price).round
          @missing_food = {name: r_food.food.name, quantity: quantity, price: price_for_missing_quantity, measurement_unit: r_food.food.measurement_unit}
          if (quantity > 0)
            @missing_foods << @missing_food unless quantity <= 0
            @total_value += price_for_missing_quantity
          end
        end
      end
      if (!@has_food)
        food = r_food.food
        @missing_food = {name: food.name, quantity: r_food.quantity, price: food.price, measurement_unit: food.measurement_unit}
        @missing_foods << @missing_food
        @total_value += food.price
      end
    end
  end

  def new
    @inventories = User.find(current_user.id).inventories
    respond_to do |format|
      format.js
    end
  end
end