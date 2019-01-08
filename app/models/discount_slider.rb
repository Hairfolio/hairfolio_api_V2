class DiscountSlider < ApplicationRecord
	belongs_to :product
	mount_uploader :banner_image, AttachmentUploader
	validates_presence_of :banner_image
end
