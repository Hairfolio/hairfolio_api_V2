class SubCategorySerializer < ActiveModel::Serializer  
  attributes :id, :name, :created_at
  belongs_to :category
end
