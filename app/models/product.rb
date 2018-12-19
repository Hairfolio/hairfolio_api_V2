class Product < ApplicationRecord
  mount_uploader :product_image, AttachmentUploader
  has_many :product_galleries
  accepts_nested_attributes_for :product_galleries, :allow_destroy => true

  belongs_to :tag
  has_and_belongs_to_many :posts
  belongs_to :user
    
  has_and_belongs_to_many :categories

  validates_presence_of :name, :tag, :product_image, :price, :quantity
  validates :price, :quantity, :numericality => { :greater_than_or_equal_to => 0 }

  has_many :favourites, dependent: :destroy
  after_create :upload_to_cloudinary

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
