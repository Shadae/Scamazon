require 'spec_helper'

describe Order do 
  let!(:order) {create{:order}}

  # describe "set_order_item_and_product" do
  #   it "returns an array w/ product and order_item" do
  #     product = Product.find(order.product_id)
  #     order_item = OrderItem.find(order.order_item_id)
  #     expect(order.set_order_item_and_product).to eq([product, order_item])
  #   end
  # end

end
