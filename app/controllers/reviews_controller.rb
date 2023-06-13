class ReviewsController < ApplicationController
  before_action :set_beach, only: [:new, :create]

  def new
    @beach = Beach.find(params[:beach_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.beach = @beach
    @review.user_id = current_user.id
    if @review.save
      redirect_to beach_path(@review.beach)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_beach
    @beach = Beach.find(params[:beach_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
