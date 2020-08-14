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
    if @item.destroy
      redirect_to  delete_done_items_path
    else
      flash.now[:alert] = '削除できませんでした'
      render :show
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
