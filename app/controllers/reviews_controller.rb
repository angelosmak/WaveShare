class ReviewsController < ApplicationController
  before_action :set_beach, only: [:new, :create]

  def new
    @beach = Beach.find(params[:beach_id])
    @review = Review.new
    # pundit
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.beach = @beach
    @review.user_id = current_user.id
    # pundit
    authorize @review
    if @review.save
      redirect_to beach_path(@review.beach), notice: 'Review was successfully created.'
    else
      flash[:alert] = "Something went wrong."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # pundit
    authorize @review
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to beach_path(@review.beach)
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
