FactoryGirl.define do
  factory :feedback do
    association :user
    association :place
    content { Faker::Lorem.paragraph }
    image { "http://url.url" } # TODO: add carrierwave
  end
end
