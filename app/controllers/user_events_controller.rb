class UserEventsController < ApplicationController

  def create
    @attendance = UserEvent.new
    @event = Event.find(params[:event_id])
    @attendance.event = @event
    @attendance.user_id = current_user.id
    @attendance.save
    redirect_to @event.beach, notice: 'Attendendance added successfully.'
    authorize @attendance
  end

  def destroy
    @attendance = UserEvent.find(params[:id])
    @event = @attendance.event
    @attendance.destroy
    redirect_to @event.beach, notice: 'Attendance cancelled successfully.'
    authorize @attendance
  end

  private

  def set_beach
    @beach = Beach.find(params[:beach_id])
  end
end
