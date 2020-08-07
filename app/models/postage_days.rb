class PostageDays < ActiveHash::Base
  include ActiveHash::Associations

  has_many :items

  # 以下は例のつもりです。 wataya
  self.data = [
      {id: 1, day: '2'},
      {id: 2, day: '5'}, 
      {id: 3, day: '7'}
  ]

end