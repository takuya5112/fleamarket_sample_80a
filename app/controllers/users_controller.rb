class UsersController < ApplicationController

  # def index
  #   @users = Users.where(saler_id: current_user.id).includes([:format])
  # end

  def show
  end

  def edit
  end
  
  def new_item
    @items = Item.where(saler_id: current_user.id).includes([:images]).order("id DESC")
  end

  def confimation_item
    @items = Item.where(buyer_id: current_user.id).includes([:images]).order("id DESC")
  end

end
