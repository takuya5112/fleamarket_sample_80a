class PostageBurden < ActiveHash::Base
  include ActiveHash::Associations

  has_many :items

  # 以下は例のつもりです。 wataya
  self.data = [
      {id: 1, burden: 'seller'},
      {id: 2, burden: 'buyer'}, 
  ]

end