class Order < ActiveRecord::Base
  has_many   :order_items
  has_many   :products, through: :order_items
  belongs_to :user
  belongs_to :purchase

  def add_quantity(amount, product_id)
    @order_item = set_order_item(product_id)
    @order_item.add(amount)
    @order_item
  end

  def check_order_quantities
    none_over = true  
    self.products.each do |product|
      @order_item = set_order_item(product.id)
      if product.stock < @order_item.quantity
        none_over = false
      end
    end
    none_over
  end

  def add(quantity, product_id)
    @product = set_product(product_id)
    unless self.products.include?(@product)
      self.products << @product
    end
    if @product.stock >= quantity
      self.add_quantity(quantity, product_id)
    else
      return false
    end
  end

  def get_merchant_products(user)
    merchant_products = []
    self.products.each do |product|
      if product.user_id == user.id
        merchant_products << product
      end
    end
    merchant_products
  end

  def self.mark_as_shipped(id)
    Order.find(id).update(status: 'shipped')
  end

  def self.get_merchant_orders(user)
    merchant_orders = []
    Order.all.each do |order|
      order.products.each do |product|
        if product.user_id == user.id
          merchant_orders << order
        end
      end
    end
    merchant_orders = merchant_orders.uniq
    merchant_orders
  end

  def self.get_shipping_estimate(order)
    @response = []
    order.products.each do |product|
      options = { origin: {country:  'US', state:  'CA', city:  'Beverly Hills', zip:  '90210'}, destination: {country: 'US', state: 'WA', city:  'Seattle', zip:  '98122' }, package: { weight: 100, dimensions: [5, 7, 6] } } 
      @response << HTTParty.post('http://localhost:4000/request.json', body: options.to_json, headers: {'Content-Type' => 'application/json'})
    end      
    @response
    # HTTParty.post('http://shipalot.herokuapp.com/request.json', body: options.to_json, headers: {'Content-Type' => 'application/json'})
  end

  private

  def set_product(id)
    Product.find(id)
  end

  def set_order_item(product_id)
   OrderItem.where(product_id: product_id, order_id: self.id).first
  end

end