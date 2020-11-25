FactoryBot.define do

  factory :project do
    name              {"test-project"}
    profile           {"これはテストプロジェクトです"}
    creator           {"testuser"}
    users
  end
end
