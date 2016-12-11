class TreatmentSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :color, :weight

  def color
    ColorSerializer.new(object.color).serializable_hash if object.color
  end
end
