json.array!(@quotes) do |quote|
  json.extract! quote, :id, :quote, :group_id
  json.url quote_url(quote, format: :json)
end
