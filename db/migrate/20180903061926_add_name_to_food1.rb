class AddNameToFood1 < ActiveRecord::Migration[5.2]
  def change
    add_column :food1s, :name, :string
  end
end
