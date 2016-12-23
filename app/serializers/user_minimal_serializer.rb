class UserMinimalSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :avatar_cloudinary_id, :first_name, :last_name, :brand_name, :salon_name, :account_type

  def brand_name
    object.brand ? object.brand.name : nil
  end

  def salon_name
    object.salon ? object.salon.name : nil
  end
end
