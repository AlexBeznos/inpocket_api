FactoryGirl.define do
  factory :share do
    name { Faker::Lorem.word }
    image { "http://user.ur" } # TODO: add carrierwave
    description { Faker::Lorem.sentence }
    association :place
  end
end
