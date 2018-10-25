class FolioSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :last_post, :posts_count

  def self.eager_load_relation(relation)
    relation.includes(:posts)
  end

  def last_post
    PostPhotosOnlySerializer.new(object.posts.last).serializable_hash if object.posts.any?
  end

  def posts_count
    object.posts.length
  end
end
