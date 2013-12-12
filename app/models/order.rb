class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user
  belongs_to :purchase

  # def initialize(product_id, quantity)
  #   @product = Product.find(product_id)
  #   @quantity = quantity
  # end
end
