class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Your product has been successfully saved!"
    else
      render :new
    end
  end

  def show
  end

  def category

  end

  def update
    
    if @product.update(product_params)

      params[:product][:categories].each do |category_id|
        next if category_id.to_i == 0
        category = Category.find(category_id.to_i) 
        @product.categories << category
      end

      redirect_to @product, notice: "Your product has been successfully updated, yo."
    else
      render :edit
    end
  end
        

private

  def set_product
    @product=Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
  
end