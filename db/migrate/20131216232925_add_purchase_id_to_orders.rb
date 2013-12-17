class AddPurchaseIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :purchase_id, :integer
  end
end
