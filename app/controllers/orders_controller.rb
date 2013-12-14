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
    proddy = Product.find(params[:product_id])
    ordy = OrderItem.where(product_id: proddy.id, order_id: @order.id)
    if @order.products.include?(proddy)
    else 
      @order.products << proddy
    end
    OrderItem.update(ordy[0].id, :quantity => ordy[0].add(params[:quantity]))
    redirect_to :back #might not be a symbol; might need some if loops to make sure back is defined
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
    # Eventually, this will need to find the user's orders
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
