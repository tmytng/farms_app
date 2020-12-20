# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    sequence(:id)   { |n| n }
    sequence(:name) { Faker::Lorem.characters(number: 15) }
    profile         { Faker::Lorem.characters(number: 40) }
    creator         { 'test-admin' }
  end
end
