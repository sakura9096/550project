json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :poster, :rating, :overview
  json.url movie_url(movie, format: :json)
end
