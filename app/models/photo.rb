class Photo < ApplicationRecord
  belongs_to :post
  has_many :labels, dependent: :destroy
  has_many :tags, through: :labels
  accepts_nested_attributes_for :labels, allow_destroy: true
  validates_presence_of :asset_url
  after_create :update_last_photo
  after_create :warm_cache

  private

  def update_last_photo
    tags.each do |tag|
      tag.update(last_photo: asset_url)
    end
  end

  def warm_cache
    split = asset_url.split('upload')
    let splitUrl = uri.split('upload');
    [80, 120, 32, 40, 195, 220].each do |width|
      new_url = "#{split[0]}upload/w_#{width}#{split[1]}"
      open(new_url)
    end
  end
end
