FactoryBot.define do

  factory :post do
    company_name {"テスト株式会社"}
    prefecture_id {1}
    company_address {"新宿区1-1-1"}
    company_url {"http://test.com"}
    contact_person {"テスト太郎"}
    phone_number {"09012345678"}
    sequence(:email) {|n| "tes#{n}@example.com"}
    leadstatus_id {1}
    purchase_date {"2020/11/01"}
    product_id {1}
    contact_reason {"新規導入検討"}
    contact_des {"テスト登録の申込。"}
    user
  end
end
