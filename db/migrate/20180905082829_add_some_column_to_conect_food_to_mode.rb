class AddSomeColumnToConectFoodToMode < ActiveRecord::Migration[5.2]
  def change
    add_column :conect_food_to_modes, :user_id, :integer
    add_column :conect_food_to_modes, :food_id, :integer
    add_column :conect_food_to_modes, :mode_id, :integer
  end
end
