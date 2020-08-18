class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_payjp_api_key, only: [:edit, :create, :destroy]
  before_action :set_credit_card_customer, only: [:edit, :destroy]
  protect_from_forgery except: :create

  def new 
  end

  def edit 
  end

  def create
    customer = Payjp::Customer.create(
      description: 'test',
      metadata: {user_id: current_user.id}
    )
    card = customer.cards.create(
      card: payjp_token_param[:"payjp-token"],
      metadata: {user_id: current_user.id}
    )

    customer_id = customer.id
    card_id = card.id

    if CreditCard.create(user_id: current_user.id, payjp_customer_id: customer_id, payjp_card_id: card_id)
      redirect_to user_path(current_user.id), notice: "クレジットカードを登録しました"
    else
      redirect_to new_credit_card_path, notice: "クレジットカードを登録できませんでした"
    end
  end

  def destroy
    @card.delete

    if @credit_card.destroy
      redirect_to user_path(current_user.id), notice: "クレジットカードを削除しました"
    else
      redirect_to edit_credit_card_path, notice: "クレジットカードを削除できませんでした"
    end
  end

  private

  def payjp_token_param
    params.permit(:"payjp-token")
  end
  
  def set_payjp_api_key
    # 後に環境変数にて設定予定。テスト用のSecretKeyのため、セキュリティ的には問題ない。
    Payjp.api_key = 'sk_test_631078351a3b43065f7af39e'
  end

  def set_credit_card_customer
    @credit_card = CreditCard.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@credit_card.payjp_customer_id)
    @card = customer.cards.retrieve(@credit_card.payjp_card_id)
  end

end
