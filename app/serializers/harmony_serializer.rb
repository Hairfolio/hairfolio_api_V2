class HarmonySerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :line, :position
  has_many :colors
end
