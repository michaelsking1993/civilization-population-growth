FactoryBot.define do

  factory :civilization do
    name { Faker::Address.city }
    population { rand(2..1000).to_s }
    growth_rate { Faker::Number.between(from: 1.0, to: 2.0).round(2) }
    current_year { rand(2000..3000) }
  end
end