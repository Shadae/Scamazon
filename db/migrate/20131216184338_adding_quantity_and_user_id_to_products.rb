class AddingQuantityAndUserIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :stock, :integer
    add_column :products, :user_id, :integer
  end
end
