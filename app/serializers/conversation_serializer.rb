class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :created_at, :last_message, :recipient_ids

  def last_message
    MessageSerializer.new(object.messages.last).serializable_hash if object.messages.any?
  end
end
