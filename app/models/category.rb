class Category < ApplicationRecord 

  validates_presence_of :name, :image
  has_and_belongs_to_many :products
  has_and_belongs_to_many :sub_categories

  mount_uploader :image, AttachmentUploader
end
