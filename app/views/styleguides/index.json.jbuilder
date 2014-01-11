json.array!(@styleguides) do |styleguide|
  json.extract! styleguide, :id, :title, :user_id
  json.url styleguide_url(styleguide, format: :json)
end
