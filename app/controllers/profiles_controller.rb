class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]


  def show
    @user = current_user
  end

  def edit
  end

  def update
    @profile = Profile.update(profile_params)
    redirect_to profile_path(@profile)
  end


  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:username, :photo )
  end
end
