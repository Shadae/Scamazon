class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      # success
      redirect_to review_path(@review)
    else
      # failure
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
   @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to :action => 'show', :id => @review, notice: "Your review has been successfully updated."
    else
      render :action => 'edit'
    end
  end


  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:review_text, :text, :rating, :integer)
  end
end
