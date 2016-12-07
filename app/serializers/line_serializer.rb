class LineSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :brand, :unit

  def unit
    object.unit.to_s
  end
end
