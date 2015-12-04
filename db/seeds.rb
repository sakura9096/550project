# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Array 
	def each!
		while count > 0 
			yield(shift)
		end 
	end
end


# res = []
# file = File.readlines("#{Rails.root}/public/TMDBMovieInfo.json").each do |line|
# 	data = JSON.parse(line)
# 	res.push(data)
# end

# genre = Set.new

# res.each! do |data|
# 	genre = genre.merge(data["genres"])
# end

# res = []
# file = File.readlines("#{Rails.root}/public/TMDBMovieInfo.json").each do |line|
# 	data = JSON.parse(line)
# 	res.push(data)
# end

# movies = []
# res.each! do |data|
# 	movies << Movie.new(title: data["title"], 
# 				overview: data["overview"], 
# 				poster: data["poster"],
# 				tmdb_id: data["id"], 
# 				rating: data["userrating"])
# end
# Movie.import movies

# genre.each do |g|
# 	Genre.create!(name: g)
# end	

# res = []
# file = File.readlines("#{Rails.root}/public/TMDBMovieInfo.json").each do |line|
# 	data = JSON.parse(line)
# 	res.push(data)
# end

# mg = []
# res.each! do |data|
# 	genres = data["genres"]
# 	genres.each do |gr_name|
# 		gr = Genre.find_by(name: gr_name)
# 		mv = Movie.find_by(tmdb_id: data["id"])
# 		mg << MovieGenre.new(movie_id: mv.id, genre_id: gr.id)
# 	end
# end

# MovieGenre.import mg



res = []
file = File.readlines("#{Rails.root}/public/TMDBMovieInfo.json").each do |line|
	data = JSON.parse(line)
	res.push(data)
end

# persons = []
# res.each do |data|
# 	persons << Person.new(profile: data["profile"],
# 				  name: data["name"],
# 				  biography: data["biography"],
# 				  day_of_birth: data["dayofbirth"],
# 				  personId: data["personId"]
# 				  )
# end
# Person.import persons

# crews = []
# res.each do |data|
# 	crew = data["crew"]
# 	tmdb_id = data["id"]
# 	if crew.size > 0
# 		crew.each do |person|
# 			personId = person["personId"]
# 			department = person["department"]
# 			job = person["job"]
# 			crews << Crew.new(person_id: personId, movie_id: tmdb_id, job: job, department: department)
# 		end
# 	end
# end
# Crew.import crews


casts = []
res.each do |data|
	cast = data["cast"]
	tmdb_id = data["id"]
	if cast.length > 0
		cast.each do |person|
			personId = person["personId"]
			character = person["character"]
			order = person["order"]
			casts << Cast.new(person_id: personId, movie_id: tmdb_id, order: order, character:character)
		end
	end
end
Cast.import casts
