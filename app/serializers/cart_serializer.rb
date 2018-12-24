class CartSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :product_id, :units, :created_at, :updated_at, :product

  def units
  	object.quantity
  end

  def product
  	Product.where(id:object.product_id).select(:id, :name, :quantity, :product_image).take
  end

end
