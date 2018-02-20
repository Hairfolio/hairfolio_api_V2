class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :likes_count, :comments_count, :liked_by_me
  has_many :photos
  has_many :videos
  has_one :user

  def photos
    object.photos.includes(labels: [:tag, formulas: [:service, treatments: [:color]]])
  end

  def liked_by_me
    object.user.likes.pluck(:post_id).include?(object.id)
  end

end
