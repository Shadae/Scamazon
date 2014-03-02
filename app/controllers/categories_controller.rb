class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    if current_user.present?
      @category = Category.new
    else
      redirect_to categories_path, notice: "Please sign in to create a category"
    end
  end

  def index
    redirect_to root_path
  end

  def edit
    redirect_to root_path
  end

  def show
    redirect_to root_path
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      if params[:category][:product_id].present?
        @product = Product.find(params[:category][:product_id])
        redirect_to edit_product_path(params[:category][:product_id]), notice: "You have successfully added a category."
      else
        redirect_to new_product_path, notice: "You have successfully added a category"
      end
    else
      redirect_to :back, notice: 'Sorry, your category did not save.'
    end
  end

  def update
    #does this just need to go away?
    if @category.update(category_params)
      redirect_to @category, notice: "Your category was successfully updated!"
    else
      render :edit
    end
  end

private

  def set_category
    @category=Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category)
  end
  
end