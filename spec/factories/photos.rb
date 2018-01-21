FactoryBot.define do
  factory :photo do
    artist        { build(:artist)}
    image         "MyString"
  end
end
