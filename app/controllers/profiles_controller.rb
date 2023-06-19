class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]


  def show
    @user = current_user
    authorize @profile
  end

  def edit
    authorize @profile
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
    authorize @profile
  end


  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:username, :photo )
  end
end
