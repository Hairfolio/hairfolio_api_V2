class ProductSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name
  belongs_to :tag

end
