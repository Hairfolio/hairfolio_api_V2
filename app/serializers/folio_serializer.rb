class FolioSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :post_ids
end
