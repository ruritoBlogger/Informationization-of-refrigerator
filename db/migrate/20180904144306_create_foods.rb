class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :user_id
      t.boolean :limittype
      t.integer :limitYear
      t.integer :limitMonth
      t.integer :limitDay
      t.integer :foodtype
      t.string :name

      t.timestamps
    end
  end
end
