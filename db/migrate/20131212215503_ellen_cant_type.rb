class EllenCantType < ActiveRecord::Migration
  def change
    rename_column :purchases, :user_id, :order_id
  end
end
