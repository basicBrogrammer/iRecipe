json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :item, :amount
  json.url ingredient_url(ingredient, format: :json)
end
