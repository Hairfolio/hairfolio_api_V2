class LabelSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :position_top, :position_left, :tag, :photo_id, :label_type
  has_many :formulas

  def label_type
    object.label_type.to_s
  end

  def tag
    TagSerializer.new(object.tag, {scope: scope}).serializable_hash
  end
end
