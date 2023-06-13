class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index] # (CP) removed spaces inside square brackets
  def index
    @beaches = Beach.all
  end

  def show
    @beach = Beach.find_by_id(params[:id])
    # @events = @beach.events
    @reviews = @beach.reviews
  end

  def new
    @beach = Beach.new
  end

  def create
    @beach = Beach.new(beach_params)
    if @beach.save
      redirect_to beach_path(@beach)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def beach_params
    params.require(:beach).permit(:name, :location, :description, :image)
  end
end
