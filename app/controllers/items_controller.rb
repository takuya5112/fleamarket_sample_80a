class ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
    @category_parents = Category.where(ancestry: nil)
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    brand_name = params[:item][:brand_name]
    if brand_name == ""
      1
    elsif Brand.where(name: brand_name).present?
      brand_id = Brand.find_by(name: brand_name).id
      @item.brand_id = brand_id
    else
      Brand.create(name: brand_name)
      brand_id = Brand.find_by(name: brand_name).id
      @item.brand_id = brand_id
    end 
    @category_parents = Category.where(ancestry: nil)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price,  :condition_id, :postage_burden_id, :prefecture_code, 
    :category_id, :postage_days_id, :seller_id, 
    item_images_attributes: [:image, :_destroy, :id]).merge(buyer_id: 1)
  end

  
end
