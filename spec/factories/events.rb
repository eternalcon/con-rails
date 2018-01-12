FactoryBot.define do
  factory :event do
    name { Faker::StarWars.wookiee_sentence }
    start_date { Faker::Time.forward(360, :morning) }
    end_date { start_date + 3.days }
    status { 'open' }
    max_participants { 100 }
    full_price { 129 }
    youth { 49 }
    child { 39 }
  end
end
