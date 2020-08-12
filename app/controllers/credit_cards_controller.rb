class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_payjp_api_key, only: [:edit, :create, :destroy]
  protect_from_forgery except: :create

  def new 
  end

  def edit 
    credit_card = CreditCard.find(1)
    # credit_card = CreditCard.find(current_user.id)

    customer = Payjp::Customer.retrieve(credit_card.payjp_customer_id)
    @card = customer.cards.retrieve(credit_card.payjp_card_id)
  end

  def create
    customer = Payjp::Customer.create(
      description: 'test',
      metadata: {user_id: 1}
      # metadata: {user_id: current_user.id}
    )
    card = customer.cards.create(
      card: payjp_token_param[:"payjp-token"],
      metadata: {user_id: 1}
      # metadata: {user_id: current_user.id}
    )

    customer_id = customer.id
    card_id = card.id

    CreditCard.create(user_id: 1, payjp_customer_id: customer_id, payjp_card_id: card_id)
    # CreditCard.create(user_id: current_user.id, payjp_customer_id: customer_id, payjp_card_id: card_id)

    redirect_to user_path(1)
    # redirect_to user_path(current_user.id)
  end

  def destroy
    credit_card = CreditCard.find(1)
    # credit_card = CreditCard.find(current_user.id)

    customer = Payjp::Customer.retrieve(credit_card.payjp_customer_id)
    card = customer.cards.retrieve(credit_card.payjp_card_id)
    card.delete

    credit_card.destroy

    redirect_to user_path(1)
    # redirect_to user_path(current_user.id)
  end

  private

  def payjp_token_param
    params.permit(:"payjp-token")
  end
  
  def set_payjp_api_key
    # 後に環境変数にて設定予定。テスト用のSecretKeyのため、セキュリティ的には問題ない。
    Payjp.api_key = 'sk_test_631078351a3b43065f7af39e'
  end


end
