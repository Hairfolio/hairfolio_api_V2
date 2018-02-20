class Photo < ApplicationRecord
  belongs_to :post
  has_many :labels, dependent: :destroy
  has_many :tags, through: :labels
  accepts_nested_attributes_for :labels, allow_destroy: true
  validates_presence_of :asset_url
  after_create :update_last_photo

  private

  def update_last_photo
    tags.each do |tag|
      tag.update(last_photo: asset_url)
    end
  end
end
