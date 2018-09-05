class AddImageToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :image_name, :string
  end
end
