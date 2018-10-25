class ContactMinimalSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :first_name, :last_name, :company, :address, :city, :state, :zipcode, :asset_url

  def self.eager_load_relation(relation)
    relation.includes(:emails)
    relation.includes(:phones)
  end

  has_many :emails
  has_many :phones
end
