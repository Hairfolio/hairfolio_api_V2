# frozen_string_literal: true

class Address < ApplicationRecord
	belongs_to :user
	has_many :orders, dependent: :destroy

	validates_presence_of :user, :email, :first_name, :last_name, :user_address, :phone, :city, :zip_code
	#:landmark, #validates_presence_of
	before_save :check_default_address, if: :default_address?

	def check_default_address
		Address.where(user_id: user.id).where.not(id: self.id).update_all(default_address: 'false')
	end
end
