class FormulaSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :post_id, :service, :time, :weight, :volume, :treatments, :label_id

  def service
    ServiceSerializer.new(object.service).serializable_hash if object.service
  end

  def treatments
    object.treatments.map { |t| TreatmentSerializer.new(t).serializable_hash }
  end
end
