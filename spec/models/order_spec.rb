require 'spec_helper'

describe Order do 
  let!(:order_item) { create(:order_item) }

  context 'methods' do

    describe 'sets_product' do
      it 'finds the correct product' do
        product = order_item.product
        order = order_item.order

        expect(order.set_product(product.id)).to eq product
      end
    end

    describe '#set_order_item' do
      it 'finds the correct order_item' do
        product = order_item.product
        order = order_item.order

        expect(order.set_order_item(product.id)).to eq order_item
      end
    end

    # this isn't passing ... but the method works. it has to do with what is being returned. Need to learn how to test the appropriate thing, I guess?
    describe 'add_quantity' do
      it 'updates the order_item with the appropriate amount' do
        product = order_item.product
        order = order_item.order
        original = order_item.quantity

        expect(order.add_quantity(5, product.id).quantity).to eq(original + 5)
      end
    end

    describe 'check_order_quantities' do
      it 'returns false if there is enough product in stock' do
        order = create(:order)
        product = create(:product1)
        order_item = OrderItem.new(product_id: product.id,
                                   order_id: order.id,
                                   quantity: 10)

        expect(order.check_order_quantities).to eq false
      end

      it 'returns true if there is not enough product in stock' do
        order = create(:order)
        product = create(:product1)
        order_item = OrderItem.new(product_id: product.id,
                                  order_id: order.id,
                                  quantity: 120)

        expect(order.check_order_quantities).to eq true
      end
    end
  end
end

  # def check_order_quantities
  #   none_are_over = true  
  #   self.products.each do |product|
  #     self.set_order_item_and_product(product.id)
  #     if product.stock < @order_item.quantity
  #       none_are_over = false
  #     end
  #   end
  #   return none_are_over
  # end
