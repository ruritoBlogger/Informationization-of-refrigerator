class DropTestModel < ActiveRecord::Migration[5.2]
  def change
      drop_table :food1s
  end
end
