FactoryBot.define do
  factory :search do
    query { "Random" }
    user { User.last || FactoryBot.create(:guest_user) }
    
    trait :invalid do
      user { nil }
    end
  end
end
