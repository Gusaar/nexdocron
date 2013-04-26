# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_type do
    name Faker::Name.name
    description Faker::Lorem.paragraph
  end
end
