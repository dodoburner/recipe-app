class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  def count_total_price
    total = 0
    self.recipe_foods.each do |rf|
      food = Food.find(rf.food_id)
      total += food.price
    end
    total
  end

  def count_total_food_items
    self.recipe_foods.sum('quantity')
  end
end
