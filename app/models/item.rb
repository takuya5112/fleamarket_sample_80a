class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  belongs_to :category
  belongs_to :brand
  belongs_to_active_hash :condition, class_name: "ItemCondition"
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :postage_days
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

end
