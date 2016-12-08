class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :contacts
  validates_presence_of :user, :description
end
