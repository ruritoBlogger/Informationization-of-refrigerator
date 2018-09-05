class ChangeFoodsAmounttype < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :amounttype, :integer
    add_column :foods, :amounttype, :string
  end
end
