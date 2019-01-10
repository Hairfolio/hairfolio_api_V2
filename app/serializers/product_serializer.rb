class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_favourite, :is_trending, :price, :product_image, :quantity,:favourites_count, :link_url, :image_url, :cloudinary_url, :created_at, :categories
  belongs_to :tag
  belongs_to :product_brand
  has_many :product_galleries

	def is_favourite
	   object.favourites.pluck(:user_id).include?(current_user_id)	   
  end

	def current_user_id
	   @instance_options[:user_id]
  end

	def product_image
		object.product_image.url
	end

end
