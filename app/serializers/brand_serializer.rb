class BrandSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :name
  has_many :services

end
