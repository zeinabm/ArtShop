json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :text, :item_id, :user_id
  json.url feedback_url(feedback, format: :json)
end
