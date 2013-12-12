class ChangeOrderIdToCategoryIdInCategoryProducts < ActiveRecord::Migration
  def change
    rename_column :category_products, :order_id, :category_id
  end
end
