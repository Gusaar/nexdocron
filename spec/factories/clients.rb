# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    name Faker::Name.name
    contact_name Faker::Name.name
    sequence(:contact_phone) { |n| "(555)-555-555#{ n.to_s[0] }" }
    contact_email Faker::Internet.email
    skype_id Faker::Lorem.word
  end
end
