FactoryGirl.define do
  factory :label do
    association :tag
    association :post
    position_top 1
    position_left 1
  end
end
