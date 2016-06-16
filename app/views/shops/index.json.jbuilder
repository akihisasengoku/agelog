json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :address, :latitude, :longitude
  json.url shop_url(shop, format: :json)
end
