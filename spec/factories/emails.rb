FactoryGirl.define do
  factory :email do
    email { Faker::Internet.email }
    email_type 'work'
    association :contact
  end
end
