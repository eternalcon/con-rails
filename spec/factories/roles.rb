FactoryBot.define do
  factory :role do
    name "MyString"
  end
  factory :admin_role, class: Role do
    name "Admin"
  end
end
