FactoryBot.define do
  factory :order do
    association :purchase
  end
end
