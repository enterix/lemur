json.array!(@orders) do |order|
  json.extract! order, :id, :age_min, :and_max, :age, :user_id
  json.url order_url(order, format: :json)
end
