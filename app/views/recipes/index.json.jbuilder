json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :description, :meal
  json.url recipe_url(recipe, format: :json)
end
