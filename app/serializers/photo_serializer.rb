class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :asset_url, :post_id, :formulas

  def formulas
    object.formulas.map {|f| FormulaSerializer.new(f).serializable_hash}
  end

end
