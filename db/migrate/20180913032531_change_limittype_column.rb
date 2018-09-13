class ChangeLimittypeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :limittype, :boolean
    add_column :foods, :limittype, :string
  end
end
