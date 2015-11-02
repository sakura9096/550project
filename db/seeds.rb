# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'Set'

res = []
file = File.readlines("#{Rails.root}/public/TMDBMovieInfo.json").each do |line|
	data = JSON.parse(line)
	res.push(data)
end



res.each do |data|
	genres = data["genres"]
	genres.each do |gr_name|
		gr = Genre.find_by(name: gr_name)
		mv = Movie.find_by(title: data["title"])
		MovieGenre.create!(movie_id: mv.id, genre_id: gr.id)
	end
end