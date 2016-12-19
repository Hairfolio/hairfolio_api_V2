class LabelSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :position_top, :position_left, :tag, :photo_id, :label_type, :name, :url, :formulas

  def label_type
    object.label_type.to_s
  end

  def formulas
    object.formulas.map { |f| FormulaSerializer.new(f).serializable_hash }
  end

  def tag
    TagSerializer.new(object.tag, {scope: scope}).serializable_hash if object.tag
  end
end
