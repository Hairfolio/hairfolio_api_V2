FactoryGirl.define do
  factory :service do
    name { Faker::Company.name }
    association :brand
    position 1
  end
end