class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      order = Order.find_by(status: 'pending')
      Order.update(order.id, :purchase_id => @purchase.id, :status => 'paid')
      redirect_to purchase_path(@purchase), notice: 'Transaction has been completed', id: order.id 
    else
      render :show
    end
  end

  def new
    @purchase = Purchase.new
  end

  def index
    @purchases = Purchase.all
  end

  def checkpurchase
    @purchase = Purchase.new
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

  def purchase_params
    params.require(:purchase).permit(:first_name, :last_name, :email_address, 
      :address1, :address2, :city, :zip, :billing_first, :billing_last, :credit_card_number,
      :cvv, :billing_zip, :billing_address1, :billing_address2, :billing_city,
      :state, :billing_state, :same_address, :email_address_confirmation, :order_id)
  end

end
