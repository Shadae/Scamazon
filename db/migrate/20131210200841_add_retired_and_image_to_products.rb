class AddRetiredAndImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :retired, :boolean, :default => false
    add_column :products, :image, :string
  end
end
