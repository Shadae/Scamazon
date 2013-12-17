class OrdersController < ApplicationController
  before_action :find_pending_order, only: [:add, :cart, :check_order_quantities, :set_order_item, :add_one_product, :subtract_one_product]

  def create
    @order = @current_user.orders.build(order_params)

    #iterates over all of the products in the order
    params[:order][:products].each do |product_id|

      #pulls out the products that have been selected
      next if product_id.to_i == 0

      #finds the product based on the product id and pushes 
      #it into the products array
      product = Product.find(product_id.to_i)
      @order.products << product
    end

    #updates the database
    @order.save
    redirect_to orders_path, notice: 'Item has been added to your cart'
  end

  def new
    @order = Order.new
    @products = Product.all.collect { |p| [p.name, p.id] }
  end

  def index
    @orders = Order.all
  end

  def show
    set_order
  end

  def add

    

    #this method called here sets @order, @product, and @order_item
    set_order_item_and_product

    #this checks to see if the product already exists in this order. 
    #If it does, nothing happens. If not, it adds the product to the order.
    unless @order.products.include?(@product)
      @order.products << @product
    end

    #This checks to see if there are enough products in stock to
    #fulfill the order
    if check_quantity(params[:quantity])
      add_quantity(params[:quantity].to_i)
      redirect_to :back, notice: "#{params[:quantity] + " " + @product.name} have been added to your cart."
    else
      redirect_to :back, notice: "I'm sorry, we don't have enough items in stock."
    end
    @order.save
  end

  def check_quantity(order_request)
    @product.stock >= order_request.to_i
  end

#this is the + button in the cart
  def add_one_product
    add_quantity(1)
    redirect_to :back
  end

#this is the - button in the cart
  def subtract_one_product
    add_quantity(-1)
    redirect_to :back, id: @order.id
  end

#this is called when you reduce the quantity of an item to 0.
#It destroys the associated OrderItem object.
  def remove_product
    OrderItem.destroy(set_order_item_and_product)
    redirect_to :back, id: @order.id
  end

  def destroy
    set_order
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def cart
    if pendingorder = Order.find_by(status: 'pending')
      @order = pendingorder
      @order.save
      @order
      render :cart
    else
      redirect_to :back, notice: 'Your cart is empty'
    end
  end

  def check_order_quantities

    none_are_over = true  
    @order.products.each do |product|
      set_order_item(product)
      if product.stock < @order_item.quantity
        none_are_over = false
      end
    end
    if none_are_over
      render '/purchases/new', order_id: @order.id
    else
      redirect_to '/cart', notice: 'We do not have enough products to fulfill that order'
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def find_pending_order
    if pending_order = Order.find_by(status: 'pending')
      @order = pending_order
    else
      @order = Order.new
      @order.save
    end
  end
#sets the cart by looking for an existing pending cart. If one exists,
#it sets the order to that. If there aren't any pending orders, it creates
#a new order.

  #needs to be separate for check_order_quantities
  def set_order_item(product)
    @order_item = OrderItem.where(product_id: product.id, order_id: @order.id)[0]
  end

#This sets @product and @order_item
  def set_order_item_and_product
    @product = Product.find(params[:product_id])
    set_order_item(@product) 
  end

#This adjusts the quantity of the order_item
  def add_quantity(amount)
    set_order_item_and_product
    OrderItem.update(@order_item.id, :quantity => @order_item.add(amount))
    @order_item.save
  end

  def order_params
    params.require(:order).permit(:status, :shipping_code, :purchase_id, :products => {})
  end

end
