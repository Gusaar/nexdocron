# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "User"
    sequence(:email) { |n| "test_#{n}@example.com" }
    password "password"
    password_confirmation "password"
    first_name Faker::Name.name
    last_name Faker::Name.name
    phone '(555)-555-5555'
    mobile '(666)-666-6666'
    sequence(:username) { |n| "username_#{n}" }
    rate 10.5
    user_type
  end

  factory :admin_user, class: User do
    username "Admin"
    sequence(:email) { |n| "admin_test_#{n}@example.com" }
    password "password"
    password_confirmation "password"
    association :user_type, name: "Admin"
  end
end
