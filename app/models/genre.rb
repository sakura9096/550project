class Genre < ActiveRecord::Base
	has_many :movie_relations, class_name: "MovieGenre",
								foreign_key: "genre_id",
								dependent: :destroy
	has_many :movies, through: :movie_relations, source: :movie
end
