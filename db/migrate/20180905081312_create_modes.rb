class CreateModes < ActiveRecord::Migration[5.2]
  def change
    create_table :modes do |t|
      t.string :user_id
      t.string :detail

      t.timestamps
    end
  end
end
