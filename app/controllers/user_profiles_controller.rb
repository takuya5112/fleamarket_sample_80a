class UserProfilesController < ApplicationController

  def new
    @profile = UserProfile.new
  end

  def create
    @profile = UserProfile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  protected

  def profile_params
    params.require(:user_profile).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day).merge(user_id: current_user.id)
  end

end
