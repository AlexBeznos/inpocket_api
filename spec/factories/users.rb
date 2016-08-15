FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.last_name }
    last_name { Faker::Name.first_name }
    signed true
    photo { "http://url.url" } # TODO: add carrierwave
  end
end
