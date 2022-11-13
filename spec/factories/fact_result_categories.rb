# frozen_string_literal: true

FactoryBot.define do
  factory :fact_result_category do
    fact_result { FactoryBot.create(:fact_result) }
    category { FactoryBot.create(:category) }

    trait :invalid do
      fact_result { nil }
      category { nil }
    end
  end
end
