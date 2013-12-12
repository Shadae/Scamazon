class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    params[:order][:products].each do |product_id|
      next if product_id.to_i == 0

      product = Product.find(product_id.to_i)

      @order.products << product
    end
    # @order.products.each do |product|
    #   same_order = OrderItem.all.each do |orderitem|
    #     if orderitem.product_id == product.id && orderitem.order_id == @order.id
    #       OrderItem.find(orderitem.id).quantity = 1
    #     end
    #   end
    # end
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

  def destroy
    set_order
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :shipping_code, :products => {})
  end

end
