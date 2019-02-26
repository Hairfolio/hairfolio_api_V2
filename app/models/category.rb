class Category < ApplicationRecord 
  has_ancestry
  has_many :children, class_name: "Category", foreign_key: "parent_id"  
  belongs_to :parent_category, class_name: "Category", foreign_key: "parent_id"
  validates_presence_of :name, :image
  has_and_belongs_to_many :products
  mount_uploader :image, AttachmentUploader 

  def parent_enum
    Category.where.not(id: id).where(ancestry: nil).map { |c| [ c.name, c.id ] }
  end

  def self.for_select
  	result = []
  	where(ancestry: nil).each do |parent_category|
  		result << [parent_category.name, parent_category.id]
  		parent_category.children.each do |child_category|
  			result << ["&#160;&#160;#{child_category.name}".html_safe, child_category.id]
  		end
  	end
  	result
  end
end
