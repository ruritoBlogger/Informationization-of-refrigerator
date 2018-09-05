class CreateConectFoodToModes < ActiveRecord::Migration[5.2]
  def change
    create_table :conect_food_to_modes do |t|

      t.timestamps
    end
  end
end
