class WhoopsEllenIsDumb < ActiveRecord::Migration
  def change
    rename_table :products, :orders
  end
end
