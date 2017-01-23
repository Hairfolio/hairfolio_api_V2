class HarmonySerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :line, :position, :colors

  def line
    LineSerializer.new(object.line, {scope: scope}).serializable_hash
  end

  def colors
    object.colors.order('code desc').map { |c| ColorSerializer.new(c).serializable_hash}
  end
end
