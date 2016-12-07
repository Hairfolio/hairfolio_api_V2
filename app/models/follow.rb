class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'
  validates_presence_of :follower, :following
  validates_uniqueness_of :follower_id, scope: :following_id
end
