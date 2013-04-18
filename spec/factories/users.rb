# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user, class: User do
    sequence(:email) { |n| "admin_test_#{n}@example.com" }
    password "password"
    password_confirmation "password"
    association :user_type, name: "Admin"
  end
end
