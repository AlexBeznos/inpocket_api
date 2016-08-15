FactoryGirl.define do
  factory :device do
    push_token Faker::Lorem.sentence(3)
    platform { Device.platforms.keys.sample }
    association :user
  end
end
