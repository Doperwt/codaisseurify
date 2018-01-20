FactoryBot.define do
  factory :song do
    name          { Faker::Name.first_name }
    description   { Faker::Lorem.sentence }
    duration      { rand(60...270)}
  end
end
