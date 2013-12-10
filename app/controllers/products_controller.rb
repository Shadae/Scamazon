class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Your product has been successfully saved!"
    end
  end

  def show
  end

private

  def set_product
    @product=Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category, :price)
  end
  
end