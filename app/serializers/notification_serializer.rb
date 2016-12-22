class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :user, :created_at, :body, :notifiable, :initiator, :notifiable_type

  def initiator
    case object.notifiable.class.name
    when 'Follow'
      UserSerializer.new(object.notifiable.follower, {scope: scope}).serializable_hash
    when 'Like'
      UserSerializer.new(object.notifiable.user, {scope: scope}).serializable_hash
    end
  end

  def user
    UserSerializer.new(object.user, {scope: scope}).serializable_hash
  end

  def notifiable_type
    object.notifiable.class.name
  end

  def notifiable
    case object.notifiable.class.name
    when 'Follow'
      FollowSerializer.new(object.notifiable, {scope: scope}).serializable_hash
    when 'Like'
      LikeSerializer.new(object.notifiable, {scope: scope}).serializable_hash
    end
  end
end
