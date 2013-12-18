class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :retire]


  def index
    @products = Product.filter(params[:category_ids],params[:seller_ids],params[:search_product])
  end

  def new
    if @current_user
      @product = Product.new
      @category = Category.new
    end
  end

  def edit
    if current_user != @product.user
      redirect_to @product, notice: "Yo, step off! Make your own product, okay?"
    else
      @category = Category.new
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
    # look for a review that belongs to the current user AND the current product
    # @product.id @current_user
    @review = Review.find_by(product_id: @product.id, user_id: @current_user.id)

    # if you find one
      # @review
    # else (you don't find one)
    if @review.nil?
      @review = Review.new
    end
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

  def retire
    @product.update(retired: true)
    redirect_to product_path(@product)
  end
        

private

  def set_product
    @product=Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :stock, :categories=>{})
  end
  
end