# frozen_string_literal: true

json.array! @projects do |project|
  json.id project.id
  json.name project.name
  json.profile project.profile
  json.user_ids project.user_ids
end
