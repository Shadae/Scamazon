class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save

    redirect_to "/reviews/#{@review.id}"
  end

  def show
   @review = Review.find(params[:id])
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:review_text, :text, :rating, :integer)
  end
end
