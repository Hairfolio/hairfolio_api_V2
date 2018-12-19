class CategorySerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :image
  has_many :products

  def products
    object.products.order("id DESC")
  end

  def image
  	object.image.url
  end

end
