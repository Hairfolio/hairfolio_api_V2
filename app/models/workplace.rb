class Workplace < ApplicationRecord
  belongs_to :salon
  has_many :users, dependent: :destroy
end
