class UserProfileSerializer < ActiveModel::Serializer
  attributes :likes, :posts, :folios

  has_many :likes
  has_many :posts
  has_many :folios
end
