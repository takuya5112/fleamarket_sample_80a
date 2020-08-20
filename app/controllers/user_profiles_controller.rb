class UserProfilesController < ApplicationController

  def new
    @profile = UserProfile.new
  end

  def create
    @profile = UserProfile.new(profile_params)
    if @profile.save
      redirect_to new_user_address_path
    else
      render :new
    end
  end

  protected

  def profile_params
    # バースデイについては後ほど実装予定
    params.require(:user_profile).permit(:first_name, :family_name, :first_name_kana, :family_name_kana).merge(user_id: current_user.id, birth_day: "2000/01/01")
  end

end
