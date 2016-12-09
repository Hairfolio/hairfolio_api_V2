class FolioSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :posts

  def posts
    object.posts.map { |p| PostSerializer.new(p).serializable_hash }
  end
end
