class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index] # (CP) removed spaces inside square brackets
  def index
    # pundit
    @beaches = policy_scope(Beach)
    @beaches = Beach.all
  end

  def show
    @beach = Beach.find_by_id(params[:id])
    @events = @beach.events
    @reviews = @beach.reviews
    # pundit
    authorize @beach
  end

  def new
    @beach = Beach.new
    # pundit
    authorize @beach
  end

  def create
    @beach = Beach.new(beach_params)
    authorize @beach
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
