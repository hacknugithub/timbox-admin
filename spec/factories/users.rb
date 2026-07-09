FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "Password26#" }
    rfc { Faker::Base.regexify(/[A-Z]{4}\d{6}[A-Z0-9]{3}/) }
  end
end