class CreateAddAmountToFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :add_amount_to_foods do |t|

      t.timestamps
    end
  end
end
