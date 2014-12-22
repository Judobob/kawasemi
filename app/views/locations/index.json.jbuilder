json.array!(@locations) do |location|
  json.extract! location, :id, :name, :description, :address_1, :adddress_2, :city, :county, :postcode, :country_id, :telephone, :website, :email
  json.url location_url(location, format: :json)
end
