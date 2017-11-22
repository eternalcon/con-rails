FactoryBot.define do
  factory :participant do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    nickname Faker::FunnyName.name
    email Faker::Internet.email
    country Faker::Address.country_code
    postcode Faker::Address.zip
    birthdate Faker::Date.backward(10000)
  end
end
