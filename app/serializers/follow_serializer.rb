class FollowSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :follower, :following

  def follower
    UserMinimalSerializer.new(object.follower, {scope: scope}).serializable_hash
  end

  def following
    UserMinimalSerializer.new(object.following, {scope: scope}).serializable_hash
  end
end
