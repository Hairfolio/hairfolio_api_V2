class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user, :created_at, :conversation_id, :body

  def user
    UserSerializer.new(object.user).serializable_hash
  end
end
