class PagesController < ApplicationController
  def dashboard
    @user = current_user
    @reviews = @user.reviews
    @events = @user.events
    @attendances = @user.user_events
  end
end
