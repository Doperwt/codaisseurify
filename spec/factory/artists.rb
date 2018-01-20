FactoryBot.define do
  factory :artist do
    name          { Faker::Name.first_name }
    bio           { Faker::Lorem.sentence }
  end
end
