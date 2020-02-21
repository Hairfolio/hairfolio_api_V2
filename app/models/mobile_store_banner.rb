class MobileStoreBanner < ApplicationRecord
  enum status: [ :inactive,:active ]

  mount_uploader :banner_image, BannerImageUploader

  validates :name, presence: true
  validates_presence_of :banner_image
  validate :validate_minimum_image_size

	def validate_minimum_image_size
		return if banner_image.path.exclude? "tmp"
		image = MiniMagick::Image.open(banner_image.path)
		unless image[:width] >= 679 && image[:height] >= 679
		errors.add :banner_image, "should be 679x679px minimum!"
		end
	end

end
