require 'spec_helper'

describe OrderItem do
  describe 'methods' do
    let(:order_item){ create(:order_item) }

    it '#adds the new amount to the order item' do
      original = order_item.quantity
      order_item.add(5)

      expect(order_item.quantity).to eq(original + 5)
    end

    it '#subtracts the amount from the order_item total' do
      original = order_item.quantity
      order_item.subtract(2)

      expect(order_item.quantity).to eq(original - 2)
    end
  end
end

  # def add(amount)
  #   self.quantity.to_i + amount.to_i
  # end

  # def subtract(amount)
  #   self.quantity.to_i - amount.to_i
  # end


