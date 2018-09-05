class AddAmountToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :amount, :integer
    add_column :foods, :amounttype, :integer
    add_column :foods, :yetamount, :integer
  end
end
