class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    if current_user.present?
      @category = Category.new
    else
      redirect_to categories_path, notice: "Please sign in to create a category"
    end
>>>>>>> master
  end

  def index
    @category = Category.all
  end

  def edit
  end

  def show
    redirect_to categories_path
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "You have successfully added a category"
    else
      render :new
    end
  end

  def update
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