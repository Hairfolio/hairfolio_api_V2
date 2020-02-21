class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description,:products,:is_trending, :likes_count, :user, :comments_count, :liked_by_me
  # has_many :products
  has_many :photos, include_nested_associations: true
  has_many :videos, include_nested_associations: true
  has_one :user

  def products
    product = []
    object.photos.each do |i|
      i.labels.each do |l|
        product.push(l.product_id)
      end
    end
    products = []
    Product.where(id: product ).each do |i|
      products.push(i.attributes.merge({"discount_percentage": i.discount_percentage,"final_price":  "%.2f" % i.final_price,"product_image": i.product_image.url,"product_thumb": i.product_image.prod_thumb_image.url}))
    end
    return products
    # return Product.where(id: product )
  end

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
