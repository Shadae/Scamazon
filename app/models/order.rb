class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user
  belongs_to :purchase



  def set_order_item_and_product(product_id)
    @product = Product.find(product_id)
    @order_item = OrderItem.where(product_id: @product.id, order_id: self.id)[0]
    return [@product, @order_item] 
  end

  def add_quantity(amount, product_id)
    set_order_item_and_product(product_id)
    OrderItem.update(@order_item.id, :quantity => @order_item.add(amount))
    @order_item.save
  end

  def check_order_quantities
    none_are_over = true  
    self.products.each do |product|
      self.set_order_item_and_product(product.id)
      if product.stock < @order_item.quantity
        none_are_over = false
      end
    end
    return none_are_over
  end

  def add(quantity, product_id)
    set_order_item_and_product(product_id)
    unless self.products.include?(@product)
      self.products << @product
    end
    if @product.stock >= quantity
      self.add_quantity(quantity, product_id)
      self.save
      return true
    else
      return false
    end
  end

end