class UserEventsController < ApplicationController

  def create
    @attendance = UserEvent.new
    @event = Event.find(params[:event_id])
    @attendance.event = @event
    @attendance.user_id = current_user.id
    @attendance.save
    redirect_to @event.beach, notice: 'Attendendance added successfully.'
  end

  def destroy
    current_user.events.delete(@user_event)
    redirect_to @user_event.event, notice: 'Attendance cancelled successfully.'
  end

  private

  def set_beach
    @beach = Beach.find(params[:beach_id])
  end
end
