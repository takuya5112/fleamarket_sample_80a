class UserAddressesController < ApplicationController

  def new
    @address = UserAddress.new
  end

  def create
    @address = UserAddress.new(address_params)
    postcode = params[:user_address][:postcode].sub(/-/,'')
    @address.postcode = postcode
    if @address.save
      redirect_to root_path
    else
      render :new
    end
  end

  

  protected

  def address_params
    params.require(:user_address).permit(:first_name, :family_name, 
    :first_name_kana, :family_name_kana, :postcode, :prefecture_code, :city,
    :house_number, :building_name, :phone_number ).merge(user_id: current_user.id)
  end

end
