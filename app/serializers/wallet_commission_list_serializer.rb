# frozen_string_literal: true

class WalletCommissionListSerializer < ActiveModel::Serializer
  attributes :id, :commission_amount, :product, :quantity, :order_id

  class ProductSerializer < ActiveModel::Serializer
    attributes :id, :name, :product_image,:product_thumb
    has_many :product_galleries

    def product_image
      { url: object.product_image.url }
    end

    def product_thumb
      object.product_image.prod_thumb_image.url
    end
  end

  def quantity
    object.order_detail.quantity
  end

  def product
    ProductSerializer.new(object.order_detail.product)
  end

  def order_id
    object.order_detail.order_id
  end
end