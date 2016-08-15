# require 'support/geocoder.rb'

FactoryGirl.define do
  street = "100 Spear St, San Francisco, CA"
  # fake_geocoder = FakeGeocoder.new(street => [100, 200])

  factory :place do
    name { Faker::Name.title }
    address { street }
    # geocoder { fake_geocoder }
    description { Faker::Lorem.paragraph }
    phones { [Faker::PhoneNumber.cell_phone] }
    logo { 'http://url' } # TODO: add carrierwave
    color { Colorable::COLORS.keys.sample }
  end
end
