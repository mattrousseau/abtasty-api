json.array! @tasks do |task|
  json.extract! task, :id, :description, :user, :client
end
