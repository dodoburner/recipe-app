# frozen_string_literal: true

class AddInventoryToInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :inventory, null: false, foreign_key: true
  end
end
