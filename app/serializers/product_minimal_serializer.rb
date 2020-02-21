class ProductMinimalSerializer < ActiveModel::Serializer
	attributes :id, :name, :product_image

	def product_image
		{"url"=> object.product_image.url,"thumb"=> object.product_image.prod_thumb_image.url}
	end
end