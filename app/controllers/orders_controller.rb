class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
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

  def checkorder
    @order = Order.new
  end

  def show
    set_order
  end

  def add
    find_order
    get_product
    unless @order.products.include?(@proddy)
      @order.products << @proddy
    end
    get_order_item
    if check_quantity(params[:quantity])
      add_order_quantity
      redirect_to :back, notice: "#{params[:quantity] + " " + @proddy.name} have been added to your cart."
    else
      redirect_to :back, notice: "I'm sorry, we don't have enough items in stock."
    end
  end

  def check_quantity(order_request)
    @proddy.stock >= order_request.to_i
  end

  def get_product
    @proddy = Product.find(params[:product_id])
  end

  def get_order_item
    find_order
    get_product
    @this_order_item = OrderItem.where(product_id: @proddy.id, order_id: @order.id) 
  end

  def add_order_quantity
    get_order_item
    OrderItem.update(@this_order_item[0].id, :quantity => @this_order_item[0].add(params[:quantity]))
  end

  def add_one_product
    get_order_item
    OrderItem.update(@this_order_item[0].id, :quantity => @this_order_item[0].add(1))
    redirect_to :back, id: @order.id
  end

  def subtract_one_product
    get_order_item
    OrderItem.update(@this_order_item[0].id, :quantity => @this_order_item[0].subtract(1))
    redirect_to :back, id: @order.id
  end

  def remove_product
    OrderItem.destroy(get_order_item)
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
    find_order
    render :cart
  end

  def find_order
    @order = Order.find_by(status: 'pending') || Order.new
    @order.save
    @order
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :shipping_code, :products => {})
  end

end
