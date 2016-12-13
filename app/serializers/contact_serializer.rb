class ContactSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :first_name, :last_name, :company, :address, :city, :state, :zipcode
  has_many :posts
  has_many :emails
  has_many :phones
end
