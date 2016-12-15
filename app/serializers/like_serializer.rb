class LikeSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :post, :user

  def post
    PostSerializer.new(object.post).serializable_hash
  end

  def user
    UserNestedSerializer.new(object.user).serializable_hash
  end

end
