FactoryBot.define do
  factory :client_user do
    name { Faker::Name.name }
    rfc { Faker::Alphanumeric.alphanumeric(number: 13) }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.url }
    user { FactoryBot.create(:user) }
    is_admin { false }
  end
end
