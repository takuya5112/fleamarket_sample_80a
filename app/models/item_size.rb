class ItemSize < ActiveHash::Base
  include ActiveHash::Associations

  has_many :items

  # 以下は例のつもりです。 wataya
  self.data = [
      {id: 1, size: '60'},
      {id: 2, size: '70'}, 
      {id: 3, size: '80'}
  ]

end