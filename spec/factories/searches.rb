FactoryBot.define do
  factory :search do
    query { Faker::Lorem.word }
    user { User.last || FactoryBot.create(:guest_user) }
    
    trait :invalid do
      query { nil }
      user { nil }
    end
  end
end
