FactoryGirl.define do
  factory :feedback do
    association :user
    association :place
    content { Faker::Lorem.paragraph }
    image { "http://url.url" } # TODO: add carrierwave
    stars { (1..5).to_a.sample }
  end
end
