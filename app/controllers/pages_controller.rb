class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home] # (CP) removed spaces inside square brackets

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
