FactoryBot.define do
  factory :event do
    name { Faker::StarWars.wookiee_sentence }
    start_date { Faker::Time.forward(360, :morning) }
    end_date { start_date + 3.days }
  end
end
