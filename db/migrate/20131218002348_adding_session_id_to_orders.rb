class AddingSessionIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :session_id, :string
  end
end
