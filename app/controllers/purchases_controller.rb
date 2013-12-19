class PurchasesController < ApplicationController
  before_action :check_billing, :only =>[:create]

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      @order = Order.find_by(status: 'pending')
      Order.update(@order.id, :purchase_id => @purchase.id, :status => 'paid')
      reduce_stock
      redirect_to purchase_path(@purchase), notice: 'Transaction has been completed', id: @order.id 
    else
      render :show
    end
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

  def check_billing
    if params[:purchase][:same_address]
      params[:purchase][:billing_first] = params[:purchase][:first_name]
      params[:purchase][:billing_last] = params[:purchase][:last_name]
      params[:purchase][:billing_address1] = params[:purchase][:address1]
      params[:purchase][:billing_address2] = params[:purchase][:address2]
      params[:purchase][:billing_city] = params[:purchase][:city]
      params[:purchase][:billing_state] = params[:purchase][:state]
      params[:purchase][:billing_zip] = params[:purchase][:zip]
    end
  end

  def show
    set_purchase
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
      :state, :billing_state, :same_address, :email_address_confirmation, :order_id, :expiration_date)
  end

end
