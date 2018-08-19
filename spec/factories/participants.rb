FactoryBot.define do
  factory :participant do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.middle_name }
    nickname { Faker::Lovecraft.deity }
    country { Faker::Address.country }
    postcode { Faker::Address.postcode }
    birthdate { Faker::Date.birthday(18, 65) }
  end
end
