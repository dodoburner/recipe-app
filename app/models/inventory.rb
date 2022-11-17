class Inventory < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  belongs_to :user
end
