FactoryBot.define do
  factory :order_purchase do
    postal_code           { "123-4567" }
    prefecture_id    { Faker::Number.between(from: 1, to: 47) }
    manicipality    { Faker::Name.initials(number: 10) }
    address     { Faker::Name.initials(number: 10) }
    building_name    { Faker::Name.initials(number: 10) }
    # phone_number          { Faker::Number.number(digits: 11) }
    phone_number          { "09011111111" }
    token          {"tok_abcdefghijk000000000000000"}
  end
end
