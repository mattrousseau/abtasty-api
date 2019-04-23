json.array! @user_clients do |user_client|
  json.extract! user_client, :client, :user
end
