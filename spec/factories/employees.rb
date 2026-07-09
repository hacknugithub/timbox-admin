FactoryBot.define do
  factory :employee do
    user { FactoryBot.create(:user) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    rfc { Faker::Alphanumeric.alphanumeric(number: 10) }
    tax_address_ciphertext { Faker::Address.street_address }
    curp_ciphertext { Faker::Alphanumeric.alphanumeric(number: 18)}
    nss_ciphertext { Faker::Alphanumeric.alphanumeric(number: 10) }
    started_working_at { Faker::Date.backward(days: 365) }
    contract_type { :indefinite }
    department { :administration }
    position { Faker::Job.title }
    daily_salary { Faker::Number.decimal(l_digits: 10, r_digits: 2) }
    monthly_salary { Faker::Number.decimal(l_digits: 10, r_digits: 2) }
    entity { 'CDMX' }
    state { 'Ciudad de México' }
  end
end
