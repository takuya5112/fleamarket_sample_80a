class ItemImage < ApplicationRecord

  belongs_to :item
  mount_uploader :image, ImageUploader
  
  mount_uploader :image, ImageUploader
end
