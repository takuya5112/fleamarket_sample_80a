class ItemCondition < ActiveHash::Base
  include ActiveHash::Associations

  has_many :items

  # 以下は例のつもりです。 wataya
  self.data = [
      {id: 1, condition: 'new'},
      {id: 2, condition: 'good'}, 
      {id: 3, condition: 'bad'}
  ]

end