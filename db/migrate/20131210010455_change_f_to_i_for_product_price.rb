class ChangeFToIForProductPrice < ActiveRecord::Migration
  def change
    remove_column :products, :price
    add_column :products, :price, :integer
  end
end
