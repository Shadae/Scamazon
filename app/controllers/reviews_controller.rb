class ReviewsController < ApplicationController
  before_action :check_login
  def new
    @review = Review.new
  end

  def create
    @product = Product.find(params[:review][:product_id])
    @user = User.find(params[:review][:user_id])
    @review = Review.new(review_params)

    if @review.save
      # success
      redirect_to product_path(@product)
    else
      # failure
      redirect_to :back, notice: 'Please enter a rating and optionally a review.'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
   @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:review][:product_id])
    @review = Review.find(params[:id])
    
    if @review.update(review_params)
      redirect_to product_path(@product.id), notice: "Your review has been successfully updated."
    else
      redirect_to :back, notice: "Your review didn't save."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to new_review_path, notice: "Review has been successfully deleted."
  end

  def index
    @review = Review.all
  end


  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:review_text, :rating, :product_id, :user_id)
  end

  def check_login
    if @current_user.nil?
      # this feature does not allow users to create a review unless logged in.
      redirect_to new_session_path, notice: "You must login!" and return
    end
  end
end
