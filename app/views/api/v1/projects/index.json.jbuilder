# frozen_string_literal: true

json.set! :comments do
  json.array! @projects do |project|
    json.extract! project, :id, :name, :profile, :creator, :created_at, :updated_at
  end
end
