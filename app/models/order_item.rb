class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def add(amount)
    self.update(quantity: (quantity + amount.to_i))
  end

  def subtract(amount)
    self.update(quantity: (quantity - amount.to_i))
  end
end
