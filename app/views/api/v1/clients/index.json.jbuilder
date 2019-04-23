json.array! @clients do |client|
  json.extract! client, :id, :name
end
