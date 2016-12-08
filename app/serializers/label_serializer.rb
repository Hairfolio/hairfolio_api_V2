class LabelSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :position_top, :position_left, :tag

  def tag
    TagSerializer.new(object.tag).serializable_hash
  end
end
