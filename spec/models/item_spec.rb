require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      before do
        user = create(:user, id: 1)
        brand = create(:brand)
        category = create(:category)
      end

      it 'is valid with all columns' do
        expect(build(:item)).to be_valid
      end

      it 'is valid without brand_id' do
        expect(build(:item, brand_id: nil)).to be_valid
      end

      it 'is valid without buyer_id' do
        expect(build(:item, buyer_id: nil)).to be_valid
      end

      it 'is valid without deal_done_date' do
        expect(build(:item, deal_done_date: nil)).to be_valid
      end
    end

    context 'can not save' do
      before do
        user = create(:user, id: 1)
        brand = create(:brand)
        category = create(:category)
      end

      it 'is invalid without image' do
        item = build(:item)
        item.item_images = []
        item.valid?
        expect(item.errors[:item_images]).to include("を入力してください")
      end

      it 'is invalid without name' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it 'is invalid without introduction' do
        item = build(:item, introduction: nil)
        item.valid?
        expect(item.errors[:introduction]).to include("を入力してください")
      end

      it 'is invalid without price' do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it 'is invalid without condition_id' do
        item = build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("を入力してください")
      end

      it 'is invalid without postage_burden_id' do
        item = build(:item, postage_burden_id: nil)
        item.valid?
        expect(item.errors[:postage_burden_id]).to include("を入力してください")
      end

      it 'is invalid without prefecture_code' do
        item = build(:item, prefecture_code: nil)
        item.valid?
        expect(item.errors[:prefecture_code]).to include("を入力してください")
      end

      it 'is invalid without postage_days_id' do
        item = build(:item, postage_days_id: nil)
        item.valid?
        expect(item.errors[:postage_days_id]).to include("を入力してください")
      end

    end
  end
end
