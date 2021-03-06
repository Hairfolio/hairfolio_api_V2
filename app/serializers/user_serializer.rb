class UserSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :email, :first_name, :default_pinterest_board, :offerings, :facebook_id, :instagram_id, :last_name, :auth_token, :likes_count, :followers_count, :account_type, :is_following_me, :is_followed_by_me, :salon, :brand, :avatar_url, :avatar_cloudinary_id, :share_facebook, :share_twitter, :share_instagram, :share_pinterest, :share_tumblr, :prof_desc, :description, :years_exp, :career_opportunity, :unread_messages_count

  def self.eager_load_relation(relation)
    relation.includes(:educations)
    relation.includes(:offerings)
    relation.includes(:experiences)
    relation.includes(:certificates)
  end

  #has_many :likes
  has_many :educations
  has_many :experiences
  has_many :certificates

  def offerings
    object.offerings.map { |o| OfferingSerializer.new(o, {scope: scope}).serializable_hash }
  end

  def likes_count
    object.likes.uniq.length
  end

  def followers_count
    object.followers.uniq.length
  end

  def salon
    SalonSerializer.new(object.salon, {scope: scope}).serializable_hash if object.salon
  end

  def brand
    BrandSerializer.new(object.brand, {scope: scope}).serializable_hash if object.brand
  end

  # def facebook_id
  #   object.authentications.facebook.first.try(:uid) if object.authentications.instagram.any?
  # end
  #
  # def instagram_id
  #   object.authentications.instagram.first.try(:uid) if object.authentications.instagram.any?
  # end

  def is_following_me
    scope && scope.current_user && object.following?(scope.current_user)
  end

  def is_followed_by_me
    scope && scope.current_user && object.followers?(scope.current_user)
  end
end
