class Note < ApplicationRecord
  belongs_to :contact

  has_and_belongs_to_many :products, dependent: :destroy

  has_many :photos, dependent: :destroy
  has_many :shared_logs, dependent: :destroy
  has_many :refers, dependent: :destroy


  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :products, allow_destroy: true
end
