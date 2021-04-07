FactoryBot.define do
  factory :item do
    product_name           { Faker::Name.initials(number: 2) }
    product_explanation    { Faker::Name.initials(number: 2) }
    product_category_id    { Faker::Number.between(from: 2, to: 11) }
    product_quality_id     { Faker::Number.between(from: 2, to: 7) }
    shipping_charges_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id          { Faker::Number.between(from: 1, to: 47) }
    delivery_days_id       {Faker::Number.between(from: 2, to: 4)}
    price                  {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_3913.JPG'), filename: 'test_image.png')
  
    end
  end
end
