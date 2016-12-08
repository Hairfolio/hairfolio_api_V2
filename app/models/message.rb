class Message < ApplicationRecord
  validates_presence_of :conversation, :user, :body
  belongs_to :conversation
  belongs_to :user
  belongs_to :post
end
