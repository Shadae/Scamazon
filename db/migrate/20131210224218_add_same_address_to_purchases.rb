class AddSameAddressToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :same_address, :boolean
  end
end
