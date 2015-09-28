json.array!(@items) do |item|
  json.extract! item, :id, :name, :content, :text
  json.url item_url(item, format: :json)
end
