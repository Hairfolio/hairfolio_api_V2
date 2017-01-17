class FolioSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :last_post

  def last_post
    PostSerializer.new(object.posts.last).serializable_hash if object.posts.any?
  end
end
