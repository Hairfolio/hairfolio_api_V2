class PostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :likes_count, :user, :comments_count, :liked_by_me, :photos

  def self.eager_load_relation(relation)
    relation.includes(:photos)
    relation.includes(:videos)
  end

  has_many :videos
  #has_one :user

  def photos
    object.photos.includes(labels: [:tag, formulas: [:service, treatments: [:color]]]).map { |p|
      {
        id: p.id,
        created_at: p.created_at,
        asset_url: p.asset_url,
        post_id: p.post_id,
        video_url: p.video_url,
        labels: p.labels.map { |l|
          {
            id: l.id,
            created_at: l.created_at,
            position_top: l.position_top,
            position_left: l.position_left,
            photo_id: l.photo_id,
            label_type: l.label_type.to_s,
            name: l.name,
            url: l.url,
            tag: l.tag ? {
              id: l.tag.id,
              created_at: l.tag.created_at,
              name: l.tag.name,
              last_photo: l.tag.last_photo
            } : nil,
            formulas: l.formulas.map { |f|
              {
                id: f.id,
                created_at: f.created_at,
                post_id: f.post_id,
                service: f.service ? {
                  id: f.service.id,
                  created_at: f.service.created_at,
                  name: f.service.name,
                  position: f.service.position
                } : nil,
                time: f.time,
                weight: f.weight,
                volume: f.volume,
                treatments: f.treatments.map { |t|
                  {
                    id: t.id,
                    created_at: t.created_at,
                    weight: t.weight,
                    color: t.color ? {
                      id: t.color.id,
                      created_at: t.color.created_at,
                      harmony_id: t.color.harmony_id,
                      code: t.color.code,
                      start_hex: t.color.start_hex,
                      end_hex: t.color.end_hex,
                      blank: t.color.blank
                    } : nil
                  }
                },
                line: f.line ? {
                  id: f.line.id,
                  created_at: f.line.created_at,
                  name: f.line.name,
                  unit: f.line.unit,
                  brand: f.line.brand ? {
                    id: f.line.brand.id,
                    created_at: f.line.brand.created_at,
                    name: f.line.brand.name,
                    info: f.line.brand.info,
                    address: f.line.brand.address,
                    city: f.line.brand.city,
                    state: f.line.brand.state,
                    zip: f.line.brand.zip,
                    website: f.line.brand.website,
                    phone: f.line.brand.phone,
                    services: f.line.brand.services.map { |s|
                      {
                        id: s.id,
                        name: s.name,
                        created_at: s.created_at,
                        position: s.position
                      }
                    }
                  } : nil
                } : nil
              }
            }
          }
        }
      }
    }
  end

  def user
    UserMinimalSerializer.new(object.user, {scope: scope}).serializable_hash
  end

  def liked_by_me
    object.user.like_ids.include?(object.id)
  end

end
