class TagSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :url
end
