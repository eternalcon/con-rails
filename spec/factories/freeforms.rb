FactoryBot.define do
  factory :freeform do
    name "MyString"
    description_de "MyText"
    description_en "MyText"
    language "MyString"
    min_age 1
    max_age 1
    max_participants 1
    event nil
  end
end
