class LikeSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :post_id, :user_id
end
