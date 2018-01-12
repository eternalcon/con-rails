FactoryBot.define do
  factory :user do
    email                     { Faker::Internet.email }
    password                  { |u| u.email }
    password_confirmation     { |u| u.email }
    confirmed_at              {  Time.now - 12.minutes }

    factory :admin_user do |user|
      after(:create) do |user|
        user.roles << create(:admin_role)
      end
    end
  end
end
