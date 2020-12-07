# frozen_string_literal: true

json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.profile user.profile
  json.email user.email
  json.position user.position
  json.admin user.admin
  json.created_at user.created_at&.to_s
  json.current_sign_in_at user.current_sign_in_at&.to_s
  json.last_sign_in_at user.last_sign_in_at&.to_s
end
