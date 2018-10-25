class BrandSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :info, :address, :city, :state, :zip, :website, :phone

  def self.eager_load_relation(relation)
    relation.includes(:services)
  end

  has_many :services

end
