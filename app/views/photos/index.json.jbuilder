json.array!(@photos) do |photo|
  json.extract! photo, :id, :content_type, :filename, :binary_data
  json.url photo_url(photo, format: :json)
end
