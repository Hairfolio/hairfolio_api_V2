class ProductSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :link_url, :image_url
  belongs_to :tag

end
