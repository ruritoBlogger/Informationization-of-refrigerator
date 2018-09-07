class RebaseFoodColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :limitYear, :integer
    add_column :foods, :limitMonth, :integer
    add_column :foods, :limitDay, :integer
    remove_column :foods, :dayDate, :date
  end
end
