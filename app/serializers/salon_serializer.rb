# class SalonSerializer < ActiveModel::Serializer
#   attributes :id, :created_at, :name, :info, :address, :city, :state, :zip, :website, :phone, :can_claim, :latitude, :longitude,:avatar_cloudinary_id

#   def avatar_cloudinary_id
#     object.owner.present? ? object.owner.avatar_cloudinary_id : "null"
#   end
# end
class SalonSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :info, :address, :city, :state, :zip, :website, :phone, :can_claim, :latitude, :longitude,:avatar_cloudinary_id

  def avatar_cloudinary_id
    object.owner.present? ? (object.owner.avatar_cloudinary_id.nil? ? (object.salon_images.present? ? object.salon_images.first.image_url : "null") : object.owner.avatar_cloudinary_id) :  (object.salon_images.present? ? object.salon_images.first.image_url : "null")
  end

   #has_many :salon_images
end