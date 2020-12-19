# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "username#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password              { '00000000' }
    password_confirmation { '00000000' }

    factory :testman, class: User do
      name { 'testman' }
      email { 'testman@test.com' }
      password              { '00000000' }
      password_confirmation { '00000000' }
    end
  end
end
