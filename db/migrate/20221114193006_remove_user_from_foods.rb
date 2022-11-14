class RemoveUserFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_reference :foods, :user, null: false, foreign_key: true
  end
end
