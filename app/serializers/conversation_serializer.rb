class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :created_at, :last_message, :recipient_ids, :unread_messages

  def last_message
    MessageSerializer.new(object.messages.last, {scope: scope}).serializable_hash if object.messages.any?
  end

  def unread_messages
    scope && scope.current_user ? (object.messages.where(read: false).where('user_id != ?', scope.current_user.id).length > 0) : 0
  end

  def recipient_ids
    object.recipient_ids.map { |r| r.to_i }
  end
end
