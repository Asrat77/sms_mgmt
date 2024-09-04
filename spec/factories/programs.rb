FactoryBot.define do
  factory :program do
    code { Faker::Name.name }
    name { Faker::Name.name }
  end
end
