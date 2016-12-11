class HarmonySerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :line, :position
  has_many :colors

  def line
    LineSerializer.new(object.line).serializable_hash
  end
end
