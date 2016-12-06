class Authentication < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  validates_presence_of :provider, :user
end
