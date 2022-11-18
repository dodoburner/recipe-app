class InventoryFoodsController < ApplicationController
  # def index
  #   @inventoryFoods = InventoryFood.all
  # end

  def new
    @inventory_food = InventoryFood.new
    @foods = Food.all
  end

  def create
    inventory_food = InventoryFood.create(inventory_food_params)
    inventory_food.inventory = Inventory.find(params[:inventory_id])
    if inventory_food.save
      flash[:success] = 'Inventory added successfully'
      redirect_to inventory_inventory_foods_path
    else
      flash.now[:error] = 'Error: Inventory could not be added'
      redirect_to new_inventory_inventory_foods_path
    end
  end

  def destroy
    InventoryFood.find(params[:id]).destroy
    redirect_to inventory_inventory_foods_path
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
