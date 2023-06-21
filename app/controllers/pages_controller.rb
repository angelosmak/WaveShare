class PagesController < ApplicationController
  def dashboard
    @user = current_user
    @reviews = @user.reviews
    @events = @user.events
    @attendances = @user.user_events
    @profile = @user.profile
  end

  def home
  end
end
