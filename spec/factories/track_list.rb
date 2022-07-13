# frozen_string_literal: true

FactoryBot.define do
  factory :track_list do
    association :user

    title { 'title' }
  end
end