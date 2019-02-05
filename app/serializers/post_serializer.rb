class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :products, :likes_count, :user, :comments_count, :liked_by_me
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

  # def liked_by_me
  #   object.user.likes.pluck(:post_id).include?(object.id)
  # end

end
