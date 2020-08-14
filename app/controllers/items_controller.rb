class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all.order('id DESC').limit(10)
  end

  def show
  end
  
  def new
    @category_parents = Category.where(ancestry: nil)
  end

  def buyers
    
  end

  def destroy
    @item.destroy
    redirect_to  delete_done_items_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
