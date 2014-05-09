json.array!(@users) do |user|
  json.extract! user, :id, :name, :lastname, :phone, :email, :address, :role_id, :shop_info_id, :avatar
  json.url user_url(user, format: :json)
end
