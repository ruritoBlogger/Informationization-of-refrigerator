class ChangeFoodLimitdata < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :limitYear, :integer
    remove_column :foods, :limitMonth, :integer
    remove_column :foods, :limitDay, :integer
    add_column :foods, :limitday, :date
  end
end
