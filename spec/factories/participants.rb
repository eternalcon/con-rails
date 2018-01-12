FactoryBot.define do
  factory :participant do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    nickname    { Faker::Name.initials(5) }
    country     { 'de' }
    postcode    { Faker::Number.number(5)}
    birthdate   { Date.today - 20.years }
  end
end
