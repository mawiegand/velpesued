
FactoryBot.define do
  factory :facility, :class => Refinery::Facilities::Facility do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

