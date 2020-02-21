class CommentSerializer < ActiveModel::Serializer
  # attributes :id, :body, :user_id, :first_name, :last_name,:account_type,:brand,:salon, :avatar_cloudinary_id, :created_at
  #
  # def user
  #   UserSerializer.new(object.user, {scope: scope}).serializable_hash
  # end

  attributes :id, :body,:user, :user_id, :first_name, :last_name,:account_type,:brand,:salon, :avatar_cloudinary_id, :created_at

  def user
    {"id" => user_id, "first_name" => first_name,"last_name"=>last_name,
     "avatar_cloudinary_id"=> avatar_cloudinary_id ,"account_type"=> account_type,"salon"=>salon,"brand"=>brand}
  end

  def user_id
  	object.user.id
  end

  def first_name
  	object.user.first_name
  end

  def last_name
  	object.user.last_name
  end

  def avatar_cloudinary_id
  	object.user.avatar_cloudinary_id
  end

  def account_type
    object.user.account_type
  end

  def salon
    object.user.salon
  end

  def brand
    object.user.brand
  end

end
