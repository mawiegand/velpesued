
FactoryBot.define do
  factory :contact, :class => Refinery::Contacts::Contact do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

