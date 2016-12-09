class LikeSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :post, :user

  def post
    PostSerializer.new(object.post).serializable_hash
  end

  
end
