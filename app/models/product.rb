class Product < ApplicationRecord
  belongs_to :tag
  validates_presence_of :name, :tag

  after_create :upload_to_cloudinary

  def upload_to_cloudinary
    if image_url
      begin
        image = Cloudinary::Uploader.upload(image_url)
        update(cloudinary_url: image['url'])
      rescue
      end
    end
  end
end
