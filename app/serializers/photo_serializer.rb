class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :asset_url, :post_id, :labels, :video_url

  def labels
    object.labels.map {|f| LabelSerializer.new(f, {scope: scope}).serializable_hash}
  end

end
