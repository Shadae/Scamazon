class OrdersController < ApplicationController
  before_action :find_pending_order, only: [:add_to_cart, :cart, :fulfillment, :check_order_quantities, :review]


# stuff liz has written

  def cart
    render partial: 'cart'
  end

  def update_quantity
    order_item = OrderItem.find(params[:order_item][:order_item_id])
    order_item.update(quantity: params[:order_item][:quantity])

    if order_item.save

      respond_to do |format|
        format.html { redirect_to :back }
        format.json { render json: order_item.as_json }
      end
    else
      render :back
    end
  end

  def remove_item
    order_item = OrderItem.find(params[:order_item][:order_item_id])
    order_item.destroy

    respond_to do |format|
        format.html { redirect_to :back }
        format.json { head :no_content }
      end
  end

# end liz's stuff









  def create
    @order = Order.new(order_params)
    @order.user_id = @current_user.id
    params[:order][:products].each do |product_id|
      next if product_id == 0
      product = Product.find(product_id)
      @order.products << product
    end
    @order.save
    redirect_to orders_path, notice: 'Item has been added to your cart'
  end



  def show
    set_order
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    if @order.add(params[:quantity].to_i, product)
      redirect_to :back, notice: "#{params[:quantity] + " " + product.name.pluralize(params[:quantity])} have been added to your cart."
    else
      redirect_to :back, notice: "I'm sorry, we don't have enough items in stock."
    end
  end


  def check_order_quantities
    if @order.check_order_quantities
      @purchase = Purchase.new
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

  def review_order
    @address_info = Purchase.find(params[:purchase_id])
    @shipping_info = Order.get_shipping_estimate(Order.find(params[:id]),
                                                params[:purchase_id])
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

  # def order_params
  #   params.require(:order).permit(:status, :user_id, :session_id, :shipping_code, :purchase_id, :order_id, :products => {})
  # end
end
