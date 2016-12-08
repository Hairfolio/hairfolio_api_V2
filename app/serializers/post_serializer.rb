class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :likes_count, :formulas, :tag_ids

  def formulas
    object.formulas.map { |f| FormulaSerializer.new(f).serializable_hash }
  end
end
