class DropTestTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :add_amount_to_foods
  end
end
