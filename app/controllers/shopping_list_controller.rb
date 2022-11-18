class ShoppingListController < ApplicationController

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end
end