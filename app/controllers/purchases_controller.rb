class PurchasesController < ApplicationController
  # before_action :check_billing, :only =>[:create]

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      @purchase.update(user_id: current_user.id) if current_user
      redirect_to review_order_path(@purchase.id,params[:order_id])
    else
      render :new
    end
  end

  def complete_order
    Order.update(@order.id, :purchase_id => @purchase.id, :status => 'paid')
      reduce_stock
      redirect_to purchase_path(@purchase), notice: 'Transaction has been completed', id: @order.id 
  end

  def new
    @purchase = Purchase.new
  end

  def index
    redirect_to root_path
  end

  def checkpurchase
    @purchase = Purchase.new
  end

  def destroy
    set_purchase
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def reduce_stock
    @order.products.each do |product|
      quantity = OrderItem.where(product_id: product.id, order_id: @order.id)[0].quantity
      Product.find(product.id).update(stock: (product.stock - quantity))
    end
  end

  def purchase_params
    params.require(:purchase).permit(:first_name, :last_name, :email_address, 
      :address1, :address2, :city, :zip, :billing_first, :billing_last, :credit_card_number,
      :cvv, :billing_zip, :billing_address1, :billing_address2, :billing_city,
      :state, :billing_state, :same_address, :email_address_confirmation, :order_id, 
      :expiration_date, :user_id)
  end

end
