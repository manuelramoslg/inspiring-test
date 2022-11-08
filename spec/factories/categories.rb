FactoryBot.define do
  factory :category do
    name { [
      "animal",
      "career",
      "celebrity",
      "dev",
      "explicit",
      "fashion",
      "food",
      "history",
      "money",
      "movie",
      "music",
      "political",
      "religion",
      "science",
      "sport",
      "travel"
  ].sample }

    trait :invalid do
      name { nil }
    end
  end
end
