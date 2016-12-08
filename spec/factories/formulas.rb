FactoryGirl.define do
  factory :formula do
    association :post
    association :service
    weight 1
    volume 1
    time 1

    after :create do |formula|
      create(:treatment, formula: formula)
    end
  end
end
