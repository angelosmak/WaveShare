class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  
  def show
    @profile.user = current_user
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
