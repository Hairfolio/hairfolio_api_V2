FactoryGirl.define do
  factory :post do
    association :user
    description { Faker::Lorem.paragraph }
    after :create do |post|
      create(:formula, post: post)
    end
  end
end
