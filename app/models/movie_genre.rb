class MovieGenre < ActiveRecord::Base
	belongs_to :movie 
	belongs_to :genre
	validates :movie_id, presence: true
	validates :genre_id, presence: true
end
