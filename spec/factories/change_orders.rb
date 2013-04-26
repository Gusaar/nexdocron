# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :change_order do
    sequence(:hours) { |n| n + 1 }
    date Time.zone.now
    end_date 1.month.from_now
    project
  end
end
