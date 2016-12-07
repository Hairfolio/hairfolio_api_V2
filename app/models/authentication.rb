class Authentication < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  validates_presence_of :provider, :user

  serialize :params

  scope :facebook, -> { joins(:provider).where("providers.name = 'facebook'") }
  scope :instagram, -> { joins(:provider).where("providers.name = 'instagram'") }


  def self.create_from_koala(params, user, provider)
    create(
      user: user,
      provider: provider,
      uid: params['id'],
      token: params['token'],
      params: params,
    )
  end

  def self.create_from_instagram(token, params, user, provider)
    create(
      user: user,
      provider: provider,
      uid: params.id,
      token: token,
      params: params
    )
  end
end
