class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  belongs_to :salon
  has_many :authentications

  accepts_nested_attributes_for :salon, allow_destroy: true

  enum account_type: [:consumer, :stylist, :brand, :owner]

  before_create :generate_authentication_token!

  before_validation :set_default_account_type

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  has_many :contacts, dependent: :destroy
  has_many :messages, dependent: :destroy

  def set_default_account_type
    self.account_type ||= 'consumer'
  end

  def generate_authentication_token!
    loop do
      self.auth_token = Devise.friendly_token
      break unless self.class.exists?(auth_token: auth_token)
    end
  end

  def self.validate_facebook_token(token)
    Koala::Facebook::API.new(token).get_object('me?fields=id,name,first_name,last_name,email,friends')
  rescue
    false
  end


  def generate_social_authentication!(name, token, secret=nil, uid_name=nil)
    Authentication.create_with(user: self, token: token, secret: secret, facebook_id: uid_name, provider: Provider.find_by(name: name)).find_or_create_by(user: self, provider: Provider.find_by(name: name))
  end

  def self.validate_instagram_token(token)
    Instagram.client(access_token: token).user
  rescue
    false
  end

  def self.create_from_social(response)
    password = Devise.friendly_token
    name = response['full_name'] ? response['full_name'] : response['name']
    user = create(email: response['email'] ? response['email'] : "socialemail#{rand(0..83293)}@example.com", first_name: name.split(' ').first, last_name: name.split(' ').last, password: password, password_confirmation: password)
    return user.valid? ? user : false
  end
end
