class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventories])
    @recipe = Recipe.find(params[:recipe])
  end

  def new
    @inventories = User.find(current_user.id).inventories
    respond_to do |format|
      format.js
    end
  end
end