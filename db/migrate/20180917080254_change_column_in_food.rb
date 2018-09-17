class ChangeColumnInFood < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :limittype, :integer
    remove_column :foods, :foodtype, :integer
    add_column :foods, :limittype, :string
    add_column :foods, :foodtype, :string
  end
end
