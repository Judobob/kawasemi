json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :id, :first_name, :second_name, :address_1, :adddress_2, :city, :county, :postcode, :country_id, :telephone, :email
  json.url user_profile_url(user_profile, format: :json)
end
