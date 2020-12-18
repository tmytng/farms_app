# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name              { 'test-project' }
    profile           { 'これはテストプロジェクトです' }
    creator           { 'testuser' }
  end

  # after(:create) do |user|
  #   create(:project_user,
  #         project: project,
  #         user: create(:user))
  #   end
  # end
end
