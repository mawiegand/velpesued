
FactoryGirl.define do
  factory :sponsor, :class => Refinery::Sponsors::Sponsor do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

