class Movie < ActiveRecord::Base
	has_many :genre_relations, class_name: "MovieGenre",
								foreign_key: "movie_id",
								dependent: :destroy
	has_many :genres, through: :genre_relations, source: :genre

	default_scope -> { order(rating: :desc) }

end
