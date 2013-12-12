class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end

  def edit
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "You have successfully added a category"
    else
      render :new
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