class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_id, :quantity, :price, :product
  
  def product
  	Product.select(:product_image, :name).where(id: object.product_id)
  end

end
