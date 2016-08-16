FactoryGirl.define do
  factory :menu_item do
    name { Faker::Name.title }
    image { "http://url.ur" } # TODO: Add carrierwave
    description { Faker::Lorem.paragraph }
    price { 9.99 }

    association :menu_category
  end
end
