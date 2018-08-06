
FactoryBot.define do
  factory :group, :class => Refinery::Divisions::Group do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

