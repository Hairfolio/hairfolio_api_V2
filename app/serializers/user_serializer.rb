class UserSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :email, :first_name, :last_name, :auth_token
  has_many :likes
end
