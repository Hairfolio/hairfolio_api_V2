class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user, :created_at, :conversation_id, :body
end
