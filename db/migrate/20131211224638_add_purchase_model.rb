class AddPurchaseModel < ActiveRecord::Migration
  def change
    rename_table :orders, :purchases

    create_table :orders do |t|
      t.string :status
      t.string :shipping_code

      t.timestamps
    end
  end
end
