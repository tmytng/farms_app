# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:id)                   { |n| n }
    sequence(:company_name)         { Faker::Lorem.characters(number: 15) }
    sequence(:prefecture_id)        { rand(1..47) }
    company_address                 { Faker::Address.full_address }
    company_url                     { Faker::Internet.url }
    contact_person                  { Faker::Lorem.characters(number: 20) }
    phone_number                    { '09012345678' }
    sequence(:email)                { |n| "tes#{n}@example.com" }
    leadstatus_id                   { rand(1..10) }
    purchase_date                   { Faker::Date.in_date_period }
    product_id                      { rand(1..4) }
    contact_reason                  { Faker::Lorem.characters(number: 10) }
    contact_des                     { Faker::Lorem.characters(number: 120) }
    user
    project
  end
end
