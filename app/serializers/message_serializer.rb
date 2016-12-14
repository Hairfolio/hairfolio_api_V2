class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user, :created_at, :conversation_id, :body, :post, :url, :read

  def user
    UserSerializer.new(object.user).serializable_hash
  end

  def post
    PostSerializer.new(object.post).serializable_hash if object.post
  end
end
