class CreateFood1s < ActiveRecord::Migration[5.2]
  def change
    create_table :food1s do |t|
      t.integer :user_id
      t.boolean :limittype
      t.integer :limitYear
      t.integer :limitMonth
      t.integer :limitDay
      t.boolean :foodtype
      t.integer :amount

      t.timestamps
    end
  end
end
