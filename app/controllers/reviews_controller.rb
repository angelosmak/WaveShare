class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.beach = @beach
    @review.user = current_user
    if @review.save
      redirect_to user_path(@review.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_beach
    @beach = Beach.find(params[:gear_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
