json.array!(@people) do |person|
  json.extract! person, :id, :profile, :name, :personId, :day_of_birth, :biography
  json.url person_url(person, format: :json)
end
