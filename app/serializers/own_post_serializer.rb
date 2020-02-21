class OwnPostSerializer < ActiveModel::Serializer

  class UserDataSerializer < ActiveModel::Serializer
    attributes :id, :account_type,:first_name, :last_name,:email, :avatar_url, :salon, :brand,:avatar_cloudinary_id
    def salon
      object.salon
    end

    def brand
      object.brand
    end
  end

  class ProductDataSerializer < ActiveModel::Serializer
    attributes :id, :product_image, :product_thumb, :price, :name

    def product_image
      object.product_image.url
    end

    def product_thumb
      object.product_image.prod_thumb_image.url
    end
  end

  attributes :id, :created_at, :description, :likes_count, :comments_count, :liked_by_me
  has_many :products, serializer: ProductDataSerializer
  has_many :photos, include_nested_associations: true
  # has_many :videos, include_nested_associations: true
  has_one :user, serializer: UserDataSerializer

  def current_user_id
    @instance_options[:user_id]
  end

  def liked_by_me
    object.likes.pluck(:user_id).include?(current_user_id)
  end
end
