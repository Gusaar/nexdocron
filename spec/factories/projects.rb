# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Client #{n}" }
    start_date Time.zone.now
    end_date 6.months.from_now
    total_hours 15000
    client
    invoicing_type
  end
end
