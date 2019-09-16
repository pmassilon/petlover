FactoryBot.define do
  factory :pet do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Carlos Amadeu #{n}" }
    kind :dog
    monthly_cost 333.0

    association :person
  end
end
