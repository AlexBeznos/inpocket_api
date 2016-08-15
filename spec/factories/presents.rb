FactoryGirl.define do
  factory :present do
    image { "http://urls.com" } # TODO: add carrierwave
    price { Faker::Commerce.price }
    description { Faker::Lorem.paragraph }
    name { Faker::Lorem.word }
    association :place
  end
end
