class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.save
    redirect_to purchases_index_path
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



  private
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:first_name, :last_name, :email_address, 
      :address1, :city, :zip, :billing_first, :billing_last, :credit_card_number,
      :cvv, :billing_zip, :billing_address1, :billing_address2, :billing_city,
      :state, :billing_state, :same_address)
  end

end
