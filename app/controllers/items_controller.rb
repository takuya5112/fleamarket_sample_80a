class ItemsController < ApplicationController
  require "payjp"
  before_action :set_item, only: [:show, :destroy, :buyers, :buy]
  before_action :set_payjp_api_key, only: [:buyers, :buy]
  before_action :set_credit_card_customer, only: [:buyers, :buy]


  def index
    @items = Item.all.order('id DESC').limit(10)
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
    brand_name = params[:item][:brand]
    @category_parents = Category.where(ancestry: nil)
    if brand_name == ""
    elsif Brand.where(name: brand_name).present?
      brand_id = Brand.find_by(name: brand_name).id
      @item.brand_id = brand_id
    else
      Brand.create(name: brand_name)
      brand_id = Brand.find_by(name: brand_name).id
      @item.brand_id = brand_id
    end 
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def destroy
    if @item.destroy
      redirect_to  delete_done_items_path
    else
      flash.now[:alert] = '削除できませんでした'
      render :show
    end
  end

  def buyers
  end

  def buy
    price = @item.price

    charge = Payjp::Charge.create(
      :amount => price,
      :customer => @customer.id,
      :currency => 'jpy',
    )

    if charge.to_h.has_key?("error")
      redirect_to buyers_item_path(@item.id), notice: "商品を購入できませんでした"
    else
      redirect_to root_path, notice: "商品を購入しました"
    end
  end

  def delete_done
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price,  :condition_id, :postage_burden_id, :prefecture_code, 
    :category_id, :postage_days_id, :seller_id, 
    item_images_attributes: [:image, :_destroy, :id]).merge( seller_id: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_payjp_api_key
    # 後に環境変数にて設定予定。テスト用のSecretKeyのため、セキュリティ的には問題ない。
    Payjp.api_key = 'sk_test_631078351a3b43065f7af39e'
  end

  def set_credit_card_customer
    @credit_card = CreditCard.find_by(user_id: current_user.id)
    @customer = Payjp::Customer.retrieve(@credit_card.payjp_customer_id)
    @card = @customer.cards.retrieve(@credit_card.payjp_card_id)
  end

end
