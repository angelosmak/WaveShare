class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_beach, only: [:new, :create]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @beach = Beach.find(params[:beach_id])
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)
    @event.beach = @beach
    @event.user_id = current_user.id

    if @event.save
      redirect_to beach_path(@event.beach), notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_beach
    @beach = Beach.find(params[:beach_id])
  end

  def event_params
    params.require(:event).permit(:beach_id, :user_id, :title, :date, :description)
  end
end
