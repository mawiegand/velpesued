
FactoryBot.define do
  factory :division, :class => Refinery::Divisions::Division do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

