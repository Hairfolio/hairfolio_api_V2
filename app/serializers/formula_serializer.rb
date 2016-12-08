class FormulaSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :post_id, :service_id, :time, :weight, :volume, :treatments

  def treatments
    object.treatments.map { |t| TreatmentSerializer.new(t).serializable_hash }
  end
end
