require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with user_id, payjp_customer_id and payjp_card_id' do
        expect(create(:credit_card)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without user_id' do
        credit_card = build(:credit_card, user_id: nil)
        credit_card.valid?
        expect(credit_card.errors[:user_id]).to include("を入力してください")
      end

      it 'is invalid without payjp_customer_id' do
        credit_card = build(:credit_card, payjp_customer_id: nil)
        credit_card.valid?
        expect(credit_card.errors[:payjp_customer_id]).to include("を入力してください")
      end

      it 'is invalid without payjp_card_id' do
        credit_card = build(:credit_card, payjp_card_id: nil)
        credit_card.valid?
        expect(credit_card.errors[:payjp_card_id]).to include("を入力してください")
      end

      it 'is invalid with same user_id' do
        credit_card1 = create(:credit_card)
        credit_card2 = build(:credit_card, user_id: credit_card1.user_id)
        credit_card2.valid?
        expect(credit_card2.errors[:user_id]).to include("はすでに存在します")
      end

      it 'is invalid with same payjp_customer_id' do
        credit_card1 = create(:credit_card)
        credit_card2 = build(:credit_card, payjp_customer_id: credit_card1.payjp_customer_id)
        credit_card2.valid?
        expect(credit_card2.errors[:payjp_customer_id]).to include("はすでに存在します")
      end

      it 'is invalid with same payjp_card_id' do
        credit_card1 = create(:credit_card)
        credit_card2 = build(:credit_card, payjp_card_id: credit_card1.payjp_card_id)
        credit_card2.valid?
        expect(credit_card2.errors[:payjp_card_id]).to include("はすでに存在します")
      end

    end
  end
end
