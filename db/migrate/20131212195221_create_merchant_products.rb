class CreateMerchantProducts < ActiveRecord::Migration
  def change
    create_table :merchant_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
