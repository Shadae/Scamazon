class OmgThatWasStupid < ActiveRecord::Migration
  def change
    rename_table :orders, :products
    rename_table :purchases, :orders
  end
end
