json.array! @users do |user|
  json.name user.name
  json.created_at user.created_at&.to_s
  json.current_sign_in_at user.current_sign_in_at&.to_s
end
