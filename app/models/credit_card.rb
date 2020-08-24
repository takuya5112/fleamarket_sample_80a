class CreditCard < ApplicationRecord

  belongs_to :user

  validates :user_id, presence: true, uniqueness: {case_sensitive: true}
  validates :payjp_customer_id, presence: true, uniqueness: {case_sensitive: true}
  validates :payjp_card_id, presence: true, uniqueness: {case_sensitive: true}

end
