FactoryGirl.define do
  factory :freeform do
    title 'Test Title'
    desc_long 'Long description'
    status StatusValue::Freeform::OPEN
  end
end
