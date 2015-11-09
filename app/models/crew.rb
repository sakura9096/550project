class Crew < ActiveRecord::Base
	belongs_to :movie, class_name: "Movie", primary_key: "tmdb_id"
	belongs_to :person, class_name: "Person", primary_key: "personId"
end
