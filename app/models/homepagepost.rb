class Homepagepost < ApplicationRecord
	belongs_to :post
	belongs_to :homepage
end
