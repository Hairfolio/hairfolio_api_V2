class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :likes_count, :formulas, :labels

  def formulas
    object.formulas.map { |f| FormulaSerializer.new(f).serializable_hash }
  end

  def labels
    object.labels.map { |f| LabelSerializer.new(f).serializable_hash }
  end
end
