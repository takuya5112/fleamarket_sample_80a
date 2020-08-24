require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with nickname, email, password and password confirmation' do
        expect(build(:user)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without nickname' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it 'is invalid without email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it 'is invalid without password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it 'is invalid with password of only 6 characters' do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end

      it 'is invalid with email without domain' do
        user = build(:user, email: "hoge@hoge")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

    end
  end
end
