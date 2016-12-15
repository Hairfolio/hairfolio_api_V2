class UserNestedSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :email, :first_name, :last_name, :auth_token, :likes_count, :followers_count, :account_type, :is_following, :salon, :brand, :avatar_url, :avatar_cloudinary_id, :share_facebook, :share_twitter, :share_instagram, :share_pinterest, :share_tumblr, :prof_desc, :years_exp, :career_opportunity
  has_many :educations
  has_many :offerings
  has_many :experiences
  has_many :certificates

  def likes_count
    object.likes.length
  end

  def followers_count
    object.followers.length
  end

  def salon
    SalonSerializer.new(object.salon, {scope: scope}).serializable_hash if object.salon
  end

  def brand
    BrandSerializer.new(object.brand, {scope: scope}).serializable_hash if object.brand
  end

  def is_following
    scope && scope.current_user && scope.current_user.following?(object) ? true : false
  end
end