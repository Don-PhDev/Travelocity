FactoryBot.define do
  factory :user do
    email { [Faker::Name.name.parameterize.underscore, "@gmail.com"].join }
    password  { "password" }
  end
end
