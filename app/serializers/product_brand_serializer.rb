class ProductBrandSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :created_at, :updated_at

  def image
  	object.image.url
  end
  
end
