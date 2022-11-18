class ShoppingListController < ApplicationController
  def index
  end

  def new
    @inventories = User.find(current_user.id).inventories
    respond_to do |format|
      format.js
    end
  end
end