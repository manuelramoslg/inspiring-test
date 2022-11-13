# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name do
      %w[
        animal
        career
        celebrity
        dev
        explicit
        fashion
        food
        history
        money
        movie
        music
        political
        religion
        science
        sport
        travel
      ].sample
    end

    trait :invalid do
      name { nil }
    end
  end
end
