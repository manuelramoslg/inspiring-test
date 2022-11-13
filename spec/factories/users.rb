# frozen_string_literal: true

FactoryBot.define do
  factory :guest_user, class: 'User' do
    email { Faker::Internet.email }
    to_create { |instance| instance.save(validate: false) }

    trait :invalid do
      email { nil }
    end
  end
end
