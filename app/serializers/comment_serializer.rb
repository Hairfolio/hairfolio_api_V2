class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :first_name, :last_name, :avatar_url, :created_at

  def user
    UserSerializer.new(object.user, {scope: scope}).serializable_hash
  end

  def first_name
  	object.user.first_name
  end

  def last_name
  	object.user.last_name
  end

  def avatar_url
  	object.user.avatar_url
  end

end
