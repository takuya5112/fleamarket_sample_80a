class PostageDays < ActiveHash::Base
  include ActiveHash::Associations

  has_many :items

  self.data = [
      {id: 1, day: '1日〜2日で発送'},
      {id: 2, day: '2日〜3日で発送'}, 
      {id: 3, day: '4日〜7日で発送'},
  ]
end