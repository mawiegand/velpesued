
FactoryBot.define do
  factory :position, :class => Refinery::Divisions::Position do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

