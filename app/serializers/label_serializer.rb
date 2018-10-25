class LabelSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :position_top, :position_left, :photo_id, :label_type, :name, :url


  has_one :tag
  has_many :formulas

  def label_type
    object.label_type.to_s
  end
end
