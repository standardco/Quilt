json.array!(@users) do |user|
  json.extract! user, :id, :FirstName, :LastName, :Email
  json.url user_url(user, format: :json)
end
