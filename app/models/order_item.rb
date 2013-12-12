class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def initialize(param = {})
    @quantity = 1
    
  end
end
