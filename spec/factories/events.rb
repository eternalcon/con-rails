FactoryGirl.define do
  factory :event do
    name "MyString"
    start_date { Time.now + 30.days }
    end_date { Time.now + 33.days }
  end
end
