class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def add(amount)
    self.quantity.to_i + amount.to_i
  end

  def subtract(amount)
    self.quantity.to_i - amount.to_i
  end
end
