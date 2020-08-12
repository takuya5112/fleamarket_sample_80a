class ItemsController < ApplicationController

  def index
    @items = Item.all.order('id DESC').limit(10)
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @category_parents = Category.where(ancestry: nil)
  end

  def buyers
    
  end
end
