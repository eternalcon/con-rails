FactoryGirl.define do
  factory :event do
    name 'Eternal Convention'
    subtitle 'Eternal Convention subtitle'
    startdate Date.parse('2017-06-12')
    enddate Date.parse('2016-06-15')
    active true
  end
end
