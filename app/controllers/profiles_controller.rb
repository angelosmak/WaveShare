class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]

  def new
    @profile = Profile.new
    @profile.user_id = current_user.id
  end

  def create
    if
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    redirect_to profile_path(@profile)
  end

  def show
    @user = current_user
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:username, :photo )
  end
end
