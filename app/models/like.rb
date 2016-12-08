class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :post, :user
  validates_uniqueness_of :post, scope: :user
end
