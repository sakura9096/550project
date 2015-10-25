class Movie < ActiveRecord::Base
	validate :title, presence: true
end
