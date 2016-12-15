class LikeSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :post, :user

  def post
    PostSerializer.new(object.post, {scope: scope}).serializable_hash
  end

  def user
    UserNestedSerializer.new(object.user, {scope: scope}).serializable_hash
  end

end
