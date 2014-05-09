json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :item_id, :user_id
  json.url comment_url(comment, format: :json)
end
