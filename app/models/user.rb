class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :seller_items, foreign_key: "seller_id", class_name: "Item", dependent: :destroy
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item", dependent: :nullify
  has_many :comments, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_one :user_address, dependent: :destroy

end
