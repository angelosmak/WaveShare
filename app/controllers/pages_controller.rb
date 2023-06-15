class PagesController < ApplicationController

  def dashboard
    @user = current_user
    @reviews = @user.reviews
    @events = @user.events
  end
end
