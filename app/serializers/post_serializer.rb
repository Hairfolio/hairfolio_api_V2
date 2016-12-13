class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :likes_count, :comments_count, :labels
  has_many :photos
  has_many :videos

  def labels
    object.labels.map { |f| LabelSerializer.new(f).serializable_hash }
  end
end
