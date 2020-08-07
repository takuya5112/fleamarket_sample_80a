class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @category_parents = Category.where(ancestry: nil)
  end

end
