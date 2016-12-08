class UserSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :email, :first_name, :last_name, :auth_token, :account_type
  has_many :likes
  has_many :educations
  has_many :offerings
end
