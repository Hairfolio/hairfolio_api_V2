class Conversation < ApplicationRecord
  validates_presence_of :sender

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  scope :participant, -> (user) { joins(:messages).where(messages: { user: user}) }
  serialize :recipient_ids

end
