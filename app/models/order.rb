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

  def add(quantity, product)
    @product = set_product(product)
    unless self.products.include?(@product)
      self.products << @product
    end
    if @product.stock >= quantity
      self.add_quantity(quantity, product.id)
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

  def self.set_options_hash(purchase_id)
    @address = set_address(purchase_id)
    @options = { origin: {country:  'US', state:  'WA', city:  'Seattle', zip:  '98101'}, destination: {country: 'US', state: @address.state, city:  @address.city, zip:  @address.zip } }
  end

  def self.get_shipping_estimate(order,purchase_id)
    @response = []
    set_options_hash(purchase_id)
    order.products.order('name ASC').uniq.each do |product|
      @options[:package] = { weight: product.weight, dimensions: [product.height, product.length, product.depth] }
      @response << [product,
                    HTTParty.post("http://localhost:4000/ups.json", body: @options.to_json, headers: {'Content-Type' => 'application/json'}),
                    HTTParty.post("http://localhost:4000/fedex.json", body: @options.to_json, headers: {'Content-Type' => 'application/json'})]
    end
    @response
  end

  private

  def self.set_address(purchase_id)
    Purchase.find(purchase_id)
  end


  def set_product(product)
    Product.find(product.id)
  end

  def set_order_item(product_id)
   OrderItem.where(product_id: product_id, order_id: self.id).first
  end

end
