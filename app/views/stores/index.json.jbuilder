json.array!(@stores) do |store|
  json.extract! store, :id, :name, :bank, :account, :account_owner, :city, :firstname, :lastname
  json.url store_url(store, format: :json)
end
