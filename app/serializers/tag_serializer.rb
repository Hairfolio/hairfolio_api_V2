class TagSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :last_photo

  def last_photo
    object.labels.first.photo.asset_url.to_s if (object.labels.count > 0 && object.labels.first.photo )
  end
end
