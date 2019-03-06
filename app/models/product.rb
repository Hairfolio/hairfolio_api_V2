class Product < ApplicationRecord
  mount_uploader :product_image, AttachmentUploader
  acts_as_paranoid
  has_many :product_galleries
  accepts_nested_attributes_for :product_galleries, :allow_destroy => true, reject_if: :all_blank

  belongs_to :tag
  has_and_belongs_to_many :posts
  belongs_to :user
  belongs_to :product_brand
    
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories, :allow_destroy => true, reject_if: :all_blank

  has_many :favourites, dependent: :destroy
  after_create :upload_to_cloudinary

  validates :name, :product_image, :price, :description, :short_description, :quantity, :tag, presence: true

  def upload_to_cloudinary
    if image_url
      begin
        image = Cloudinary::Uploader.upload(image_url)
        # :nocov:
        update(cloudinary_url: image['url'])
        # :nocov:
      rescue
      end
    end
  end
end
