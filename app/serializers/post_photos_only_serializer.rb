class PostPhotosOnlySerializer < ActiveModel::Serializer
  attributes :id, :photos

  def self.eager_load_relation(relation)
    relation.includes(:photos)
  end

  def photos
    object.photos.map { |p| {asset_url: p.asset_url } }
  end

end
