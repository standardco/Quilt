json.array!(@components) do |component|
  json.extract! component, :id, :title, :description, :notes, :dependencies, :code
  json.url component_url(component, format: :json)
end
