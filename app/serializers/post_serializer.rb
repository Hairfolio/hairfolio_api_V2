class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :likes_count, :comments_count, :liked_by_me
  has_many :photos
  has_many :videos
  has_one :user

  def liked_by_me
    object.user.likes.include?(object)
  end

end
