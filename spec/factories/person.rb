FactoryBot.define do
  factory :person do
    sequence(:id) { |n| n }
    sequence(:full_name) { |n| "Carlos Amadeu #{n}" }
    document { CPF.generate }
    birthdate { Date.parse('26/02/1980')}
    sequence(:email) { |n| "carlos_amadeu_#{n}@person.com" }
    confirmed_at Time.zone.now
    password 'password'
  end
end
