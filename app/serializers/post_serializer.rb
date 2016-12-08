class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :descriotion, :likes_count
end
