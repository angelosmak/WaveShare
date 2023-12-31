class ReviewsController < ApplicationController
  before_action :set_beach, only: %i[index new create]
  before_action :set_review, only: [:destroy]

  def index
    @reviews = @beach.reviews
  end

  def show
  end

  def new
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
    @review.destroy
    if URI(request.referer).path.include?("beaches")
      redirect_to @review.beach, notice: 'Review was successfully destroyed.'
    else
      redirect_to request.referer, notice: 'Review was successfully destroyed.'
    end
    authorize @review
  end

  private

  def set_beach
    @beach = Beach.find(params[:beach_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :beach_id)
  end
end
