class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to_active_hash :condition, class_name: "ItemCondition"
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :size, class_name: "ItemSize"
  belongs_to_active_hash :postage_days
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  validates :item_images, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :condition_id, presence: true
  validates :postage_burden_id, presence: true
  validates :prefecture_code, presence: true
  validates :postage_days_id, presence: true
end
