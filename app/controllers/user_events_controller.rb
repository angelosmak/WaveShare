class UserEventsController < ApplicationController
  def create
    @attendance = UserEvent.new
    @event = Event.find(params[:event_id])
    @attendance.event = @event
    @attendance.user_id = current_user.id
    @attendance.save
    if URI(request.referer).path.include?("events")
      redirect_to @event, notice: 'Attendendance added successfully.'
    else
      redirect_to request.original_url, notice: 'Attendance added successfully.'
    end
    authorize @attendance
  end

  def destroy
    @attendance = UserEvent.find(params[:id])
    @event = @attendance.event
    @attendance.destroy
    if URI(request.referer).path.include?("events")
      redirect_to @event, notice: 'Attendendance cancelled successfully.'
    else
      redirect_to request.referer, notice: 'Attendance cancelled successfully.'
    end
    authorize @attendance
  end

  private

  def set_beach
    @beach = Beach.find(params[:beach_id])
  end
end
