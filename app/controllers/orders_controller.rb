class OrdersController < ApplicationController
  before_action :find_pending_order, only: [:add, :remove_product, :cart, :fulfillment, :check_order_quantities, :add_one_product, :subtract_one_product]

  def create
    @order = Order.new(order_params)
    @order.user_id = @current_user.id
    params[:order][:products].each do |product_id|
      next if product_id.to_i == 0
      product = Product.find(product_id.to_i)
      @order.products << product
    end
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
    if @order.add(params[:quantity].to_i, params[:product_id].to_i)
      redirect_to :back, notice: "#{params[:quantity] + " " + Product.find(params[:product_id]).name.pluralize(params[:quantity])} have been added to your cart."
    else
      redirect_to :back, notice: "I'm sorry, we don't have enough items in stock."
    end
  end

#this is the + button in the cart
  def add_one_product
    @order.add_quantity(1, params[:product_id].to_i)
    redirect_to :back
  end

#this is the - button in the cart
  def subtract_one_product
    @order.add_quantity(-1, params[:product_id].to_i)
    redirect_to :back, id: @order.id
  end

#this is called when you reduce the quantity of an item to 0.
#It destroys the associated OrderItem object.
  def remove_product
    OrderItem.destroy(@order.set_order_item_and_product(params[:product_id]))
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

  def check_order_quantities
    if @order.check_order_quantities
      render '/purchases/new', order_id: @order.id
    else
      redirect_to '/cart', notice: 'We do not have enough products to fulfill that order'
    end
  end

  def fulfillment 
  end

  def paid
  end

  def shipped
  end

  def pending
  end

  def mark_as_shipped
    Order.mark_as_shipped(params[:order_id])
    redirect_to :back
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def find_pending_order
    if pending_order = find_order.where(status: 'pending')[0]
      @order = pending_order
    else
        @order = Order.new
      if @current_user
        @order.user_id = @current_user.id
      else
        @order[:session_id] = session.id
      end
      @order.save
    end
  end

  def find_order
    if @current_user
      Order.where(user_id: @current_user.id)
    else
      Order.where(session_id: session.id)
    end
  end

  def order_params
    params.require(:order).permit(:status, :user_id, :session_id, :shipping_code, :purchase_id, :order_id, :products => {})
  end
end
