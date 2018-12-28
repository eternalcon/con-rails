FactoryBot.define do
  factory :event do
    name { Faker::StarWars.wookiee_sentence }
    start_date { Faker::Time.forward(360, :morning) }
    end_date { start_date + 3.days }
    max_participants { Faker::Number.between(1, 200) }
    full_price { Faker::Number.decimal(2) }
    youth { Faker::Number.decimal(2) }
    child { Faker::Number.decimal(2) }
    status { nil }
  end
end
