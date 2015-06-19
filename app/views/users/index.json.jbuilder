json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :avatar, :last_active, :alumni, :admin
  json.url user_url(user, format: :json)
end
