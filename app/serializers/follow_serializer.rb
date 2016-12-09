class FollowSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :follower, :following

  def follower
    UserSerializer.new(object.follower).serializable_hash
  end

  def following
    UserSerializer.new(object.following).serializable_hash
  end
end
