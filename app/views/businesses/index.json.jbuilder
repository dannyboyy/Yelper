json.array!(@businesses) do |business|
  json.extract! business, :id, :name, :address, :rating
  json.url business_url(business, format: :json)
end
