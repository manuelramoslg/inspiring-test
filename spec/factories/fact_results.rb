FactoryBot.define do
  factory :fact_result do
    url { Faker::Commerce.promotion_code(digits: 22) }
    value { Faker::ChuckNorris.fact }

    trait :with_category do
      categories { [ FactoryBot.create(:category) ] }  
    end

    trait :invalid do
      url { nil }
      value { nil }
    end
  end
end
