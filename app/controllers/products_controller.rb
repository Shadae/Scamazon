class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.all
  end

  def new
    if @current_user
      @product = Product.new
    end
  end

  def edit
    if @current_user.id != @product.user
      redirect_to @product, notice: "Yo, step off! Make your own product, okay?"
    end
  end

  def create
    @product = @current_user.products.build(product_params)

    params[:product][:categories].each do |category_id|
      next if category_id.to_i == 0
      category = Category.find(category_id)
      @product.categories << category
    end

    if @product.save
      redirect_to @product, notice: "Your product has been successfully saved!"
    else
      render :new
    end
  end

  def show
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
    params.require(:product).permit(:name, :description, :price, :image, :categories=>{})
  end
  
end