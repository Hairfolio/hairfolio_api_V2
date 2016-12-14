class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :asset_url, :post_id, :labels

  def labels
    object.labels.map {|f| LabelSerializer.new(f).serializable_hash}
  end

end
