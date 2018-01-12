FactoryBot.define do
  factory :event_registration do
    event
    user
    payment_status { 'open' }

    after(:create) do |event_registration|
      event_registration.participants << create(:participant)
    end
  end
end
