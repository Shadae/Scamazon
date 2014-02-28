class AddingWeightAndShippingInfo < ActiveRecord::Migration
  def change
    add_column :products, :weight, :integer
    add_column :products, :height, :integer
    add_column :products, :length, :integer
    add_column :products, :depth, :integer
  end
end
