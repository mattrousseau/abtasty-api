json.array! @clients do |client|
  json.extract! client, :name
end
