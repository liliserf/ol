FactoryGirl.define do
  factory :business do
    uuid { SecureRandom.uuid }
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    country { Faker::Address.country }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.url }
  end
end