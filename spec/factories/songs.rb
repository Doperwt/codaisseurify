FactoryBot.define do
  factory :song do
    name          { Faker::Name.first_name }
    duration      { rand(60...270)}
  end
end
