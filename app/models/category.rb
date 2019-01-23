class Category < ApplicationRecord 
  has_ancestry
  has_many :children, class_name: "Category", foreign_key: "parent_id"  
  belongs_to :parent_category, class_name: "Category", foreign_key: "parent_id"
  validates_presence_of :name, :image
  has_and_belongs_to_many :products
  mount_uploader :image, AttachmentUploader 

  def parent_enum
    Category.where.not(id: id).map { |c| [ c.name, c.id ] }
  end
  
end
