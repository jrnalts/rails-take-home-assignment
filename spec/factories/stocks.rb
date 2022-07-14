# frozen_string_literal: true

FactoryBot.define do
  factory :stock do
    trait :unavailable_stock do
      deleted_at { Time.current }
    end
  end
end