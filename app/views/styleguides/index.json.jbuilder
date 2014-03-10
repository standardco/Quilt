json.array!(@styleguides) do |styleguide|
  json.extract! styleguide, :id, :title, :user_id
  json.url user_styleguide_url(styleguide, format: :json)
end
