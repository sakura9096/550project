class Movie < ActiveRecord::Base
	has_many :genre_relations, class_name: "MovieGenre",
								foreign_key: "movie_id",
								dependent: :destroy
	has_many :genres, through: :genre_relations, source: :genre

	default_scope -> { order(rating: :desc) }

	has_many :crew_relations, class_name: "Crew", foreign_key: "movie_id", primary_key: "tmdb_id"
	has_many :crews, through: :crew_relations, source: :person, primary_key: "tmdb_id"

	has_many :cast_relations, class_name: "Cast", foreign_key: "movie_id", primary_key: "tmdb_id"
	has_many :casts, through: :cast_relations, source: :person, primary_key: "tmdb_id"
end
