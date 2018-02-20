class LikeSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  has_one :post
  has_one :user

end
