class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def add(amount)
    bar = self.quantity.to_i + amount.to_i
    bar
  end

  def subtract(amount)
    self.quantity = self.quantity - amount
    self.save
  end
end
