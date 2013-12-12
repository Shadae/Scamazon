class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :category_products do |t|
      t.integer :product_id
      t.integer :order_id

      t.timestamps
    end
  end
end
