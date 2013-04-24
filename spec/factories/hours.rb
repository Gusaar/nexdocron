# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hour do
    total_hours 3.50
    tasks_description Faker::Lorem.paragraph
    date Time.zone.now
    project
    user
  end
end
