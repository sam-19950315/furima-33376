FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3) }
    password_confirmation  { password }
    last_name              { Gimei.last.kanji }
    first_name             { Gimei.first.kanji }
    last_name_katakana     { Gimei.last.katakana }
    first_name_katakana    { Gimei.first.katakana }
    birthday               { Faker::Date.backward }
    id                     { 1 }
  end
end
