# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    name Faker::Name.name
    contact_name Faker::Name.name
    contact_phone "(555)-555-5555"
    contact_email Faker::Internet.email
    skype_id Faker::Lorem.word
  end
end
