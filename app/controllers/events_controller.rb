class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_beach, only: %i[new create]
  def index
    @events = policy_scope(Event)
    @events = Event.all
  end

  def show
    @beach = @event.beach
    @markers = [{
  lat: @beach.latitude,
  lng: @beach.longitude
  }]
    # pundit
    authorize @event
  end

  def new
    @beach = Beach.find(params[:beach_id])
    @event = Event.new
    # pundit
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.beach = @beach
    @event.user_id = current_user.id
    # pundit
    authorize @event
    if @event.save
      redirect_to beach_path(@event.beach), notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # pundit
    authorize @event
  end

  def update
    if @event.update(event_params)
      redirect_to beach_path(@event.beach), notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
    # pundit
    authorize @event
  end

  def destroy
    # pundit
    authorize @event
    @event.destroy
    redirect_to beach_path(@event.beach), notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_beach
    @beach = Beach.find(params[:beach_id])
  end

  def event_params
    params.require(:event).permit(:beach_id, :user_id, :title, :date, :description, :photo)
  end
end
