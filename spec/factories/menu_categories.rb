FactoryGirl.define do
  factory :menu_category do
    name { Faker::Name.title }
    association :place
  end
end
