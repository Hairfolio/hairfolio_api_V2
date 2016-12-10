class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :created_at, :last_message, :recipient_ids

  def last_message
    MessageSerializer.new(object.messages.last).serializable_hash if object.messages.any?
  end

  def recipient_ids
    object.recipient_ids.map { |r| r.to_i }
  end
end
