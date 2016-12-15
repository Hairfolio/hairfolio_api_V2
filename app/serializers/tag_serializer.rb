class TagSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :url, :last_photo

  def last_photo
    object.labels.first.photo.asset_url if (object.labels.any? && object.labels.first.photo)
  end
end
