class Person < ActiveRecord::Base
	has_many :movie_relations, class_name: "Crew", foreign_key: "person_id", primary_key: "personId"
	has_many :working_movies, through: :movie_relations, source: :movie, primary_key: "personId"

	has_many :acting_relations, class_name: "Cast", foreign_key: "person_id", primary_key: "personId"
	has_many :acting_movies, through: :acting_relations, source: :movie, primary_key: "personId"
end
