class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true

  # validates :email, presence: true, uniqueness: true,
  #                                   format: {
  #                                     with: /\A\S+@\S+\.\S+\z/
  #                                   }
  # validates :encrypted_password, presence: true,
  #                                 length: {
  #                                   minimum: 6
  #                                 } 
  # validates :first_name, presence: true,
  #                                 format: {
  #                                   with: /\A[ぁ-んァ-ン一-龥]/
  #                                 }
  # validates :family_name, presence: true,
  #                                 format: {
  #                                   with: /\A[ぁ-んァ-ン一-龥]/
  #                                 }
  # validates :first_name_kana, presence: true,
  #                                 format: {
  #                                   with: /\A[ァ-ヶー－]+\z/
  #                                 }
  # validates :family_name_kana	, presence: true,
  #                                 format: {
  #                                   with: /\A[ァ-ヶー－]+\z/
  #                                 }
  # validates :birth_date, presence: true

  has_many :seller_items, foreign_key: "seller_id", class_name: "Item", dependent: :destroy
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item", dependent: :nullify
  has_many :comments, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_one :user_address, dependent: :destroy

end
