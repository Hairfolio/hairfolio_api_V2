FactoryGirl.define do
  factory :label do
    association :tag
    association :photo
    position_top 1
    position_left 1
  end
end
