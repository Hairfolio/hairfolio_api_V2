class TagSearchSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description,:is_trending, :likes_count, :user, :comments_count, :liked_by_me,:products
  #has_many :products

  def products
    object.products.map do |object|
      object.attributes.slice('id','name','price').merge("final_price"=>object.final_price,
                                                         "product_image"=>object.product_image.url,
                                                         "product_thumb"=>object.product_image.prod_thumb_image.url)
    end
  end

  has_many :photos, include_nested_associations: true
  has_many :videos, include_nested_associations: true
  has_one :user

  def photos
    object.photos.includes(labels: [:tag, formulas: [:service, treatments: [:color]]])
  end

  def liked_by_me
    object.likes.pluck(:user_id).include?(current_user_id)
  end

  def current_user_id
    @instance_options[:user_id]
  end

  def user
    UserMinimalSerializer.new(object.user, {scope: scope}).serializable_hash
  end
end
